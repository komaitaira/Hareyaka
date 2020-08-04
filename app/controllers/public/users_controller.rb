class Public::UsersController < ApplicationController
  before_action :set_current_user, except: [:follows]
  before_action :set_search_genre
  before_action :set_ranking
  before_action :set_ransack
  
  def show
    # userのお気に入り記事のgenre_nameの配列を取得
    array = @user.favorite_articles.joins(:genre).pluck(:genre_name)
    # genre_nameとその個数のハッシュを取得し、@genredataに代入
    @genredata = array.group_by(&:itself).map{ |genre_name, value| [genre_name, value.count] }.to_h
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "会員情報の更新が完了しました。"
    else
      render :edit
    end
  end

  def unsubscribe
  end

  def hide
    @user.update(is_active: false)
    reset_session
    redirect_to thanks_path
  end

  def follows
    user = User.find(params[:id])
    # userがフォローしている企業の情報を@followsと定義
    @follows = user.followings.page(params[:page])
  end

  private
  def set_current_user
    @user = current_user
  end

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

  def user_params
    params.require(:user).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :postal_code, :address, :phone_number, :email, :profile_image)
  end
end
