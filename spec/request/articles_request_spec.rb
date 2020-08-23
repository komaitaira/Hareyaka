require 'rails_helper'

RSpec.describe "Public_Articles", type: :request do
  describe '記事一覧ページ' do
    context "記事一覧ページが正しく表示される" do
      before do
        get articles_path
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end
  end
end