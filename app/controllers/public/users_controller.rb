class Public::UsersController < ApplicationController
  before_action :set_current_user, except: [:favorites]
  
  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "会員情報の更新が完了しました。"
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

  def favorites
    @favorite_articles = current_user.favorite_articles.page(params[:page]).reverse_order
  end

  private
  def set_current_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :postal_code, :address, :phone_number, :email, :profile_image)
  end
end
