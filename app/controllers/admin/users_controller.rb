class Admin::UsersController < Admin::ApplicationController
  before_action :set_user, only:[:show, :edit, :update]
  
  def index
    @users = User.page(params[:page])
    @search = User.ransack(params[:q])
    @q_users = @search.result.page(params[:page])
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_user_path(@user)
    else
      render :edit
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :postal_code, :address, :phone_number, :email, :profile_image, :is_active)
  end
end
