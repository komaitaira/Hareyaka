class Admin::CompaniesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_company, only:[:show, :edit, :update]

  def index
    @companies = Company.page(params[:page])
    @search = Company.ransack(params[:q])
    @q_companies = @search.result.page(params[:page])
  end

  def show
    # @companyに紐づくお気に入りが最も多いものを取得。(articleとgenreのis_activeがそれぞれtrueのものを限定)
    article_ids = @company.articles.joins(:favorites).joins(:genre).where(articles: { is_active: true }).where(genres: { is_active: true }).pluck(:id)
    @company_ranks = Article.limit(1).find(article_ids)
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
