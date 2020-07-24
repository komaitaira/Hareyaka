class Public::CompaniesController < Public::ApplicationController
  def show
    @company = Company.find(params[:id])
  end
end
