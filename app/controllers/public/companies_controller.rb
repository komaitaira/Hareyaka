class Public::CompaniesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_search_genre, only:[:index]
  before_action :set_ranking, only:[:index, :show]
  before_action :set_ransack, only:[:index]

  def index
    @companies = Company.all.page(params[:page])
  end

  def show
    @company = Company.find(params[:id])
    # @companyに紐づくお気に入りが最も多いものを取得。(articleとgenreのis_activeがそれぞれtrueのものを限定)
    article_ids = @company.articles.joins(:favorites).joins(:genre).where(articles: { is_active: true }).where(genres: { is_active: true }).pluck(:id)
    @company_ranks = Article.limit(1).find(article_ids)

    # current_userと@companyとのroomがあるかどうかで分岐
    @currentUserEntry = Room.where(user_id: current_user.id)
    @companyEntry = Room.where(company_id: @company.id)
    @currentUserEntry.each do |cu|
      @companyEntry.each do |c|
        if cu.id == c.id then
          @isRoom = true
          @roomId = cu.id
        end
      end
    end
    unless @isRoom
      @room = Room.new
    end
  end

  private
  def set_search_genre
    if params[:genre_id].present?
      # genre_idが与えられている場合、genre_idに合致する記事を探す
      @articles = Article.where(is_active: true).joins(:genre).where(genres: {is_active: true}).where(genre_id: params[:genre_id])
      .page(params[:page]).reverse_order
    else
      # 掲載ステータスが有効かつジャンルが有効になっている記事のみ探す
      @articles = Article.where(is_active: true).joins(:genre).where(genres: {is_active: true})
      .page(params[:page]).reverse_order
    end
    @genres = Genre.all
  end

  def set_ranking
    # Articleモデルからcreate_all_ranks(article.rbに定義)で検索してきた結果を@all_ranksに代入
    @all_ranks = Article.create_all_ranks
  end

  def set_ransack
    # 検索フォーム表示のため@searchを定義
    @search = Article.where(is_active: true).joins(:genre).where(genres: {is_active: true}).ransack(params[:q])
    # params[:q]がviewから渡されてきた場合、resultを返す
    if params[:q].present?
      @q_articles = @search.result.page(params[:page]).reverse_order
    end
  end
end