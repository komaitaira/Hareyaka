# frozen_string_literal: true

class Corporate::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create # 登録申請時、管理者へ通知送信
    super
    if resource.errors.empty?
      notification = Notification.new(
        sender_id: Company.last.id,
        sender_class: "company",
        receiver_id: Admin.first.id,
        receiver_class: "admin"
      )
      notification.save if notification.valid?
      notification_guest = Notification.new(
        sender_id: Company.last.id,
        sender_class: "company",
        receiver_id: Admin.last.id, # ゲスト管理者
        receiver_class: "admin"
      )
      notification_guest.save if notification_guest.valid?
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:company_name, :kana_company_name, :postal_code, :address, :phone_number])
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  # end

  def after_update_path_for(resource)
    corporate_company_path(resource)
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
