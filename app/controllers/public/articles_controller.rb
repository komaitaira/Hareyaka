class Public::ArticlesController < Public::ApplicationController
  def index
    @articles = Article.page(params[:page])
  end

  def show
    @article = Article.find(params[:id])
  end
end
