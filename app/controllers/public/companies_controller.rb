class Public::CompaniesController < ApplicationController
  before_action :authenticate_user!, only:[:show]
  before_action :set_search_genre, only:[:index]

  def index
    # 申請が承認済かつ企業ステータスが有効(退会していない状態)のcomapnyの一覧
    @companies = Company.all.where(approved: true, is_active: true).page(params[:page])
  end

  def show
    @company = Company.find(params[:id])
    @articles = @company.articles.all_active.page(params[:page]).order(updated_at: "DESC")
    # @companyに紐づくお気に入りが最も多いものを3つ表示。(articleとgenreのis_activeがそれぞれtrueのものを限定)
    article_ids = @company.articles.joins(:favorites).all_active.pluck(:id)
    three_ids = article_ids.group_by(&:to_i).sort_by{|_,v|-v.size}.map(&:first).first(3)
    @company_ranks = Article.find(three_ids)

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
      @articles = Article.all_active.where(genre_id: params[:genre_id])
      .page(params[:page]).reverse_order
    else
      # 掲載ステータスが有効かつジャンルが有効になっている記事のみ探す
      @articles = Article.all_active
      .page(params[:page]).reverse_order
    end
    @genres = Genre.all
  end

end