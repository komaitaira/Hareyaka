class Public::ArticlesController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show]
  before_action :set_search_genre
  before_action :set_ranking
  before_action :set_ransack

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
      @articles = Article.where(genre_id: params[:genre_id])
      .page(params[:page]).reverse_order
    else
      # ジャンルが有効になっている記事のみ探す
      @articles = Article.joins(:genre).where(genres: {is_active: true})
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
    @search = Article.ransack(params[:q])
    # params[:q]がviewから渡されてきた場合、resultを返す
    if params[:q].present?
      @q_articles = @search.result.page(params[:page]).reverse_order
    end
  end
end