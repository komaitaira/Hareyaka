class Admin::ApplicationController < ApplicationController
  layout 'admin/application'
  # before_action :authenticate_admin!

  # 詳細検索サイドバーの検索結果
  # def set_search_user
  #   @search_user = User.ransack(params[:q])
  #   @q_users = @search_user.result.page(params[:page])
  # end

  # def set_search_company
  #   @search_company = Company.ransack(params[:q])
  #   @q_companies = @search_company.result.page(params[:page])
  # end

  # before_action :configure_permitted_parameters, if: :devise_controller?

  # # 管理者ログイン後　＝＞　記事一覧
	# def after_sign_in_path_for(resource)
	# 	articles_path
  # end

  # # 管理者ログアウト後　＝＞　ログイン画面
  # def after_sign_out_path_for(resource)
  #   new_admin_session_path
  # end

  # protected
	# def configure_permitted_parameters
	# 	devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
	# end
end