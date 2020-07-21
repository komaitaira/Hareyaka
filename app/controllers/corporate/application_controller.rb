class Corporate::ApplicationController < ApplicationController
  layout 'corporate/application'
  # before_action :authenticate_company!
  # before_action :configure_permitted_parameters, if: :devise_controller?

  # # 企業ログイン後　＝＞　記事一覧
	# def after_sign_in_path_for(resource)
	# 	corporate_articles_path
  # end

  # # 企業ログアウト後　＝＞　トップ画面　rootパスはhome topを設定済み。
  # def after_sign_out_path_for(resource)
  #   root_path
  # end

  # # signup/ユーザー登録情報
  # protected
	# def configure_permitted_parameters
	# 	devise_parameter_sanitizer.permit(:sign_up, keys: [:company_name, :kana_company_name, :postal_code, :address, :phone_number, :email, :is_active])
	# end
end