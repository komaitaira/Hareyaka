class Public::ApplicationController < ApplicationController
  layout 'public/application'
  # before_action :authenticate_user!
  # before_action :configure_permitted_parameters, if: :devise_controller?

  # # 会員ログイン後　＝＞　記事一覧
	# def after_sign_in_path_for(resource)
	# 	articles_path
  # end

  # # 会員ログアウト後　＝＞　トップ画面　rootパスはhome topを設定済み。
  # def after_sign_out_path_for(resource)
  #   root_path
  # end

  # # signup/ユーザー登録情報
  # protected
	# def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :kana_last_name, :kana_first_name, :postal_code, :address, :phone_number, :email, :password, :encrypted_password, :is_active])
	# end
end