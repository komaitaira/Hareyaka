class Corporate::CompaniesController < ApplicationController
  before_action :authenticate_company!
  before_action :set_current_company, except: [:followers]

  def show
    @articles = @company.articles.all_active.page(params[:page]).order(updated_at: "DESC")
    # @companyに紐づくお気に入りが最も多いものを3つ取得。(articleとgenreのis_activeがそれぞれtrueのものを限定)
    article_ids = @company.articles.joins(:favorites).all_active.pluck(:id)
    three_ids = article_ids.group_by(&:to_i).sort_by{|_,v|-v.size}.map(&:first).first(3)
    @company_ranks = Article.find(three_ids)
  end

  def edit
  end

  def update
    if @company.update(company_params)
      redirect_to corporate_company_path(@company), notice: "企業情報の更新が完了しました。"
    else
      render :edit
    end
  end

  def unsubscribe
  end

  def hide
    @company.update(is_active: false)
    reset_session
    redirect_to thanks_path
  end

  def followers
    company = Company.find(params[:id])
    # companyがフォローされている会員の情報を@followersと定義
    @search = company.followers.ransack(params[:q])
    @q_followers = @search.result.page(params[:page])

    # CSVエクスポート機能
    @followers = company.followers
    respond_to do |format|
      format.html
      format.csv do |csv|
        send_data render_to_string, filename: "フォロワー会員一覧.csv", type: :csv
      end
    end
  end

  private
  def set_current_company
    @company = current_company
  end

  def company_params
    params.require(:company).permit(:company_name, :kana_company_name, :postal_code, :address, :phone_number, :email, :profile_image, :background_image, :introduction)
  end
end
