Company.create!(
  [
    {
      id: 1,
      company_name: "株式会社三菱USJ銀行",
      kana_company_name: "カブシキガイシャミツビシユーエスジェーギンコウ",
      postal_code: "9999999",
      address: "東京都千代田区丸の内9丁目99-99",
      phone_number: "99999999999",
      email: "mitsubishi@email.com",
      password: "mitsubishi",
      password_confirmation: "mitsubishi",
      introduction: "弊社のページをご覧いただきまして誠にありがとうございます。
                    お金に関する悩みの解消のために必要なこととして、これからの時代は資産運用が非常に大切になってきます。
                    掲載されている記事についてはもちろんのこと、それ以外のお金の不安や悩み、誠心誠意で対応いたします。
                    お気軽にご連絡ください。",
      is_active: true,
      profile_image_id: open("./db/images/三菱USJ銀行.jpeg"),
      background_image_id: open("./db/images/三菱USJ銀行背景.jpeg")
    },

    {
      id: 2,
      company_name: "ヨントリーホールディングス",
      kana_company_name: "ヨントリーホールディングス",
      postal_code: "8888888",
      address: "東京都千代田区丸の内8丁目88-88",
      phone_number: "88888888888",
      email: "yontory@email.com",
      password: "yontory",
      password_confirmation: "yontory",
      introduction: "弊社のページをご覧いただきまして誠にありがとうございます。
                    健康に関する悩みはお任せください！弊社では特定健康保険食品を豊富に取り揃えております。
                    掲載記事についてはもちろん、健康についてのご相談、それ以外のこと、なんでもお聞きしますので安心してご連絡ください。",
      is_active: true,
      profile_image_id: open("./db/images/ヨントリーホールディングス.png"),
      background_image_id: open("./db/images/ヨントリーホールディングス背景.jpg")
    }
  ]
)