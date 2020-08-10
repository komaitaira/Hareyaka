class Admin::ArticlesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_article, only:[:show, :edit, :update]
  
  def index
    # @articles = Article.page(params[:page])
    @search = Article.ransack(params[:q])
    @q_articles = @search.result.page(params[:page]).reverse_order
  end

  def show
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to admin_article_path(@article.id), notice: "記事情報の更新が完了しました。"
    else
      render :edit
    end
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:company_id, :genre_id, :title, :body, :image, :is_active)
  end
end