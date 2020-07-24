class Admin::GenresController < Admin::ApplicationController
  before_action :set_genre, only:[:edit, :update]

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genres_path, notice: "ジャンルを新規登録しました。"
    else
      @genres = Genre.all
      render :index
    end
  end

  def edit
  end

  def update
    if @genre.update(genre_params)
      redirect_to admin_genres_path, notice: "ジャンル情報の更新が完了しました。"
    else
      render :edit
    end
  end

  private
  def set_genre
    @genre = Genre.find(params[:id])
  end

  def genre_params
    params.require(:genre).permit(:genre_name, :is_active)
  end
end
