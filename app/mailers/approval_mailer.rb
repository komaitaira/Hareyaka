class ApprovalMailer < ApplicationMailer
  
  def send_when_admin_approved(company) #メソッドに対して引数を設定
    @company = company #法人情報
    if Rails.env.production?
      @url = 'https://hareyaka.work/companies/sign_in' # 本番環境のURL
    else
      @url = 'http://localhost:3000/companies/sign_in' # 開発環境のURL
    end
    mail to: company.email, subject: '【Hareyaka】 登録申請が承認されました。'
  end

end