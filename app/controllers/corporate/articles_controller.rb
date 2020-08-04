class Corporate::ArticlesController < ApplicationController
  before_action :set_article, only:[:show, :edit, :update, :destroy]

  def index
    # @articles = Article.page(params[:page])
    @search = current_company.articles.ransack(params[:q])
    @q_articles = @search.result.page(params[:page]).reverse_order
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.company_id = current_company.id
    if @article.save
      redirect_to corporate_article_path(@article.id), notice: "記事を新規投稿しました。"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to corporate_article_path(@article.id), notice: "記事情報の更新が完了しました。"
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to corporate_articles_path, notice: "記事情報の削除が完了しました。"
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:company_id, :genre_id, :title, :body, :image, :is_active)
  end

end