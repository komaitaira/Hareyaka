Company.create!(
  [ 
    {
      id: 1,
      company_name: "ヨントリーホールディングス",
      kana_company_name: "ヨントリーホールディングス",
      postal_code: "1111111",
      address: "東京都千代田区丸の内1丁目111-11-1",
      phone_number: "11111111111",
      email: "yontory@example.com",
      password: "yontory",
      password_confirmation: "yontory",
      introduction: "弊社のページをご覧いただきまして誠にありがとうございます。
                    健康に関する悩みはお任せください！弊社では特定健康保険食品を豊富に取り揃えております。
                    掲載記事についてはもちろん、健康についてのご相談、それ以外のこと、なんでもお聞きしますので安心してご連絡ください。",
      profile_image: open("./db/images/yontory-face.png"),
      background_image: open("./db/images/yontory-bg.jpg"),
      is_active: true
    },

    {
      id: 2,
      company_name: "株式会社三菱USJ銀行",
      kana_company_name: "カブシキガイシャミツビシユーエスジェーギンコウ",
      postal_code: "2222222",
      address: "東京都千代田区丸の内2丁目222-22-2",
      phone_number: "22222222222",
      email: "mitsubishi@example.com",
      password: "mitsubishi",
      password_confirmation: "mitsubishi",
      introduction: "弊社のページをご覧いただきまして誠にありがとうございます。
                    お金に関する悩みの解消のために必要なこととして、これからの時代は資産運用が非常に大切になってきます。
                    掲載されている記事についてはもちろんのこと、それ以外のお金の不安や悩み、誠心誠意で対応いたします。
                    お気軽にご連絡ください。",
      profile_image: open("./db/images/mitsubishi-face.png"),
      background_image: open("./db/images/mitsubishi-bg.jpg"),
      is_active: true
    },

    {
      id: 3,
      company_name: "株式会社光星",
      kana_company_name: "カブシキガイシャコウセイ",
      postal_code: "3333333",
      address: "東京都千代田区丸の内3丁目333-33-3",
      phone_number: "33333333333",
      email: "kose@example.com",
      password: "kosekose",
      password_confirmation: "kosekose",
      introduction: "弊社のページをご覧いただきまして誠にありがとうございます。
                    近年、美容業界は目まぐるしい成長を遂げております。
                    化粧は女性のするものという概念から一転し、最近では化粧をする男性も増えてきており、
                    今後もより一層、市場の拡大が見込まれます。
                    弊社では化粧品や美容グッズを豊富に取り揃え、多くのお客様にご満足いただけるよう邁進していきます。
                    掲載記事についてはもちろん、美容についてのご相談、それ以外のこと、なんでもお聞きしますので安心してご連絡ください。",
      profile_image: open("./db/images/kose-face.jpg"),
      background_image: open("./db/images/kose-bg.jpg"),
      is_active: true
    },

    {
      id: 4,
      company_name: "ブロンズジム",
      kana_company_name: "ブロンズジム",
      postal_code: "4444444",
      address: "東京都千代田区丸の内4丁目444-44-4",
      phone_number: "44444444444",
      email: "bronze@example.com",
      password: "bronze",
      password_confirmation: "bronze",
      introduction: "弊社のページをご覧いただきまして誠にありがとうございます。
                    トレーニングのこと、健康のこと、美容のこと、なんでもお聞きします！。
                    筋トレは体を鍛えることと思いがちですが、それ以上に心のトレーニングに繋がります。
                    美容や健康への注目が集まっている昨今では、今後もより一層、市場の拡大が見込まれます。
                    弊社ではトレーニングに関する知識はもちろん、先述した他業界への知識が豊富な社員が多くおります。
                    多くのお客様にご満足いただけるよう邁進していく所存でございますので、お気軽にご連絡ください！
                    また、ご興味がある方は是非ジムへ御来店くださいませ。",
      profile_image: open("./db/images/bronze-face.png"),
      background_image: open("./db/images/bronze-bg.jpg"),
      is_active: true
    },

    {
      id: 5,
      company_name: "株式会社インフラボトム",
      kana_company_name: "カブシキガイシャインフラボトム",
      postal_code: "5555555",
      address: "東京都千代田区丸の内5丁目555-55-5",
      phone_number: "55555555555",
      email: "infura@example.com",
      password: "infura",
      password_confirmation: "infura",
      introduction: "弊社のページをご覧いただきまして誠にありがとうございます。
                    プログラミング学習でお悩みの方、これから始めたいとお考えの方、是非弊社へご連絡ください。
                    現在、プログラミングは全国の小学校で必修科目となり、非常に注目が集まっている昨今では、今後もより一層、市場の拡大が見込まれます。
                    弊社ではプログラミングに関する知識が豊富な社員がたくさんおります。
                    多くのお客様にご満足いただけるよう邁進していく所存でございますので、お気軽にご連絡ください！",
      profile_image: open("./db/images/infura-face.png"),
      background_image: open("./db/images/infura-bg.jpg"),
      is_active: true
    }
  ]
)