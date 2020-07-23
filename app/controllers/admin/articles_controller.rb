class Admin::ArticlesController < Admin::ApplicationController
  def index
    @articles = Article.page(params[:page])
    @search = Article.ransack(params[:q])
    @q_articles = @search.result.page(params[:page])
  end

  def show
  end

  def edit
  end

  def update
  end
end