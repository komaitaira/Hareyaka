class Public::UsersController < Public::ApplicationController
  before_action :set_current_user, only:[:show, :edit, :update, :hide]
  
  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to mypage_path, notice: "会員情報の更新が完了しました。"
    else
      render :edit
    end
  end

  def unsubscribe
  end

  def hide
    @user.update(is_active: false)
    reset_session
    redirect_to thanks_path
  end

  private
  def set_current_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :postal_code, :address, :phone_number, :email)
  end
end
