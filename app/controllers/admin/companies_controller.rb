class Admin::CompaniesController < Admin::ApplicationController
  before_action :set_company, only:[:show, :edit, :update]

  def index
    @companies = Company.page(params[:page])
    @search = Company.ransack(params[:q])
    @q_companies = @search.result.page(params[:page])
  end

  def show
  end

  def edit
  end

  def update
    if @company.update(company_params)
      redirect_to admin_company_path(@company)
    else
      render :edit
    end
  end

  private
  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:company_name, :kana_company_name, :postal_code, :address, :phone_number, :email, :profile_image, :is_active)
  end
end
