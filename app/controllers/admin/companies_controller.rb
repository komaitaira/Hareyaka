class Admin::CompaniesController < ApplicationController
  before_action :set_company, only:[:show, :edit, :update]

  def index
    @companies = Company.page(params[:page])
    @search = Company.ransack(params[:q])
    @q_companies = @search.result.page(params[:page])
  end

  def show
    # Articleモデルからcreate_all_ranks(article.rbに定義)で検索してきた結果を@all_ranksに代入
    @all_ranks = Article.create_all_ranks
    # @all_ranksの記事の中から@companyの記事のみ取り出す
    @company_ranks = @all_ranks.select do |all_rank|
      all_rank.company_id == @company.id
    end
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
