class Public::ArticlesController < ApplicationController
  before_action :authenticate_user!, except:[:index]

  def index
    @articles = Article.page(params[:page]).reverse_order
  end

  def show
    @article = Article.find(params[:id])
  end
end