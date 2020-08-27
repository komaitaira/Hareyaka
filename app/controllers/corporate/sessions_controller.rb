# frozen_string_literal: true

class Corporate::SessionsController < Devise::SessionsController
  before_action :reject_unapproved_company, only: [:create]
  before_action :reject_inactive_company, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  # 企業ログイン後　＝＞　記事一覧
	def after_sign_in_path_for(resource)
		corporate_articles_path
  end

  # 企業ログアウト後　＝＞　トップ画面　rootパスはhome topを設定済み。
  def after_sign_out_path_for(resource)
    root_path
  end

  # 登録未承認の場合、ログイン画面へリダイレクト
  def reject_unapproved_company
    @company = Company.find_by(email: params[:company][:email])
    if @company
      if @company.valid_password?(params[:company][:password]) && !@company.approved
        flash[:danger] = '登録申請が未承認です。申し訳ございませんが、承認済メールが届くまで今しばらくお待ちください。'
        redirect_to new_company_session_path
      end
    end
  end

  # 退会済みの場合、ログイン画面へリダイレクト
  def reject_inactive_company
    @company = Company.find_by(email: params[:company][:email])
    if @company
      if @company.valid_password?(params[:company][:password]) && !@company.is_active
        flash[:danger] = 'お客様は退会済みです。申し訳ございませんが、別のメールアドレスをお使いください。'
        redirect_to new_company_session_path
      end
    end
  end
end
