class Public::ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_search_genre, only: [:index, :show]
  before_action :set_ranking, only: [:index]

  def index
  end

  def show
    @article = Article.find(params[:id])
  end

  def favorites
    # user.rbにfavorite_articlesアソシエーション記述。中間テーブルfavoritesを仲介し、current_userに結びつくお気に入り記事を取得
    @favorite_articles = current_user.favorite_articles
    .page(params[:page])

    # userのお気に入り記事のgenre_nameの配列を取得
    array = @favorite_articles.joins(:genre).pluck(:genre_name)
    # genre_nameとその個数のハッシュを取得し、@genredataに代入
    @genredata = array.group_by(&:itself).map{ |genre_name, value| [genre_name, value.count] }.to_h
  end

  private
  def set_search_genre
    if params[:genre_id].present?
      # genre_idが与えられている場合、genre_idに合致する記事を探す
      @articles = Article.all_active.where(genre_id: params[:genre_id])
      .page(params[:page]).order(updated_at: "DESC")
    else
      # 掲載ステータスが有効かつジャンルが有効になっている記事のみ探す
      @articles = Article.all_active
      .page(params[:page]).order(updated_at: "DESC")
    end
    @genres = Genre.all
  end

  def set_ranking
    # 全記事の中からお気に入りが最も多いものを3つ取得。(articleとgenreのis_activeがそれぞれtrueのものを限定)
    article_ids = Article.joins(:favorites).all_active.pluck(:id)
    three_ids = article_ids.group_by(&:to_i).sort_by{|_,v|-v.size}.map(&:first).first(3)
    @all_ranks = Article.find(three_ids)
  end
end