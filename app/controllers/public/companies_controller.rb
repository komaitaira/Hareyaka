class Public::CompaniesController < ApplicationController
  def show
    @company = Company.find(params[:id])
  end
end
