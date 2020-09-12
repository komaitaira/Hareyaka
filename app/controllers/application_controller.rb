class ApplicationController < ActionController::Base
  before_action :set_ransack
  def set_ransack
    # 検索フォーム表示のため@searchを定義
    @search = Article.all_active.ransack(params[:q])
    # params[:q]がviewから渡されてきた場合、resultを返す
    if params[:q].present?
      @q_articles = @search.result.page(params[:page]).order(updated_at: "DESC")
    end
  end
end
