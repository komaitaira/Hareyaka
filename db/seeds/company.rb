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
      profile_image: open("./db/images/mitsubishi-face.jpg"),
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
      profile_image: open("./db/images/bronze-face.jpg"),
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
      profile_image: open("./db/images/infura-face.jpg"),
      background_image: open("./db/images/infura-bg.jpg"),
      is_active: true
    },

    {
      id: 6,
      company_name: "株式会社グルメアソシエーションズ",
      kana_company_name: "カブシキガイシャグルメアソシエーションズ",
      postal_code: "6666666",
      address: "東京都千代田区丸の内6丁目666-66-6",
      phone_number: "66666666666",
      email: "gourmet@example.com",
      password: "gourmet",
      password_confirmation: "gourmet",
      introduction: "弊社のマイページをご覧いただき誠にありがとうございます。株式会社グルメアソシエーションズは1990年に創業して以来、
                    皆様に愛されて今年30周年を迎えることができました。「料理で人を幸せにする」という理念の下、常に最高のものを提供できるように日々邁進して参りました。
                    さて、そんなミレニアムイヤーの本年ですが、世界中に蔓延するコロナウイルスで多くの企業様やその元で働く社員様が多大な影響を受けておられるかと存じます。
                    弊社も少なからずその影響を受けておりますが、こんな時だからこそ皆様と協力してこの窮地を乗り越えていきたいと考えております。
                    我々が与えられるのは料理しかありませんが、その料理が皆様の笑顔につながれば、これ以上の幸福はありません。
                    是非、料理に関するお悩みや掲載されている記事についてご相談がございましたらお気軽にご連絡ください。",
      profile_image: open("./db/images/gourmet-face.png"),
      background_image: open("./db/images/gourmet-bg.jpg"),
      is_active: true
    },

    {
      id: 7,
      company_name: "セカンドリテイリング",
      kana_company_name: "セカンドリテイリング",
      postal_code: "7777777",
      address: "東京都千代田区丸の内7丁目777-77-7",
      phone_number: "77777777777",
      email: "second@example.com",
      password: "second",
      password_confirmation: "second",
      introduction: "セカンドリテイリングのマイページへようこそ！弊社は日本を中心とするアジア圏を主な商業範囲とし、
                    高品質かつリーズナブルな洋服を皆様へお届けするアパレルメーカーです。
                    アパレル業界は変化が激しい業界で、流行り廃りの周期が非常に早く、常に先々を見て新しい情報を手に入れる必要がございます。
                    これまでは弊社では実店舗販売を主な事業としておりましたが、
                    IT技術の発展に伴い現在はオンライン販売にも力を入れております。Hareyakaでは弊社の新商品などの商品情報をはじめ、
                    ファッションに関する記事をたくさん掲載しておりますので
                    ご興味のある方は是非記事をお読み頂き、またお悩みやご相談がある方はDMにて弊社へご連絡くださいませ。",
      profile_image: open("./db/images/second-face.png"),
      background_image: open("./db/images/second-bg.jpg"),
      is_active: true
    },

    {
      id: 8,
      company_name: "TryMoveCorporation",
      kana_company_name: "トライムーブコーポレーション",
      postal_code: "8888888",
      address: "東京都千代田区丸の内8丁目888-88-8",
      phone_number: "88888888888",
      email: "tmc@example.com",
      password: "tmctmc",
      password_confirmation: "tmctmc",
      introduction: "TryMoveCorporationはスポーツ医学を通じ、スポーツをする方々の挑戦をサポートする専門医療チームです。
                    主に選手の身体能力の強化、好成績を出すための身体の使い方、怪我の予防、治療などを取り扱っております。
                    チームメンバーには病気や怪我のリハビリテーションを専門とする理学療法士、作業療法士、柔道整復師をはじめ、
                    内科医、外科医、トレーナーなども在籍しております。人数は少数ですが精鋭が揃っておりますので、
                    スポーツでの怪我や病気に関するお悩みがございましたら是非ご連絡ください。",
      profile_image: open("./db/images/tmc-face.png"),
      background_image: open("./db/images/tmc-bg.jpg"),
      is_active: true
    },

    {
      id: 9,
      company_name: "HOME MADE株式会社",
      kana_company_name: "ホームメイドカブシキガイシャ",
      postal_code: "9999999",
      address: "東京都千代田区丸の内9丁目999-99-9",
      phone_number: "99999999999",
      email: "homemade@example.com",
      password: "homemade",
      password_confirmation: "homemade",
      introduction: "ここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入ります
                    ここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入ります
                    ここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入ります
                    ここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入ります
                    ここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入ります
                    ここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入ります
                    ここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入ります",
      profile_image: open("./db/images/homemade-face.png"),
      background_image: open("./db/images/homemade-bg.jpg"),
      is_active: true
    },

    {
      id: 10,
      company_name: "わんにゃんカンパニー",
      kana_company_name: "ワンニャンカンパニー",
      postal_code: "1230000",
      address: "東京都足立区123-12-1",
      phone_number: "12300000000",
      email: "wannyan@example.com",
      password: "wannyan",
      password_confirmation: "wannyan",
      introduction: "ここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入ります
                    ここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入ります
                    ここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入ります
                    ここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入ります
                    ここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入ります
                    ここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入ります
                    ここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入ります",
      profile_image: open("./db/images/wannyan-face.png"),
      background_image: open("./db/images/wannyan-bg.jpg"),
      is_active: true
    },

    {
      id: 11,
      company_name: "Haruアカデミー合同会社",
      kana_company_name: "ハルアカデミーゴウドウガイシャ",
      postal_code: "2341111",
      address: "神奈川県横浜市港南区234-23-2",
      phone_number: "23400000000",
      email: "haru@example.com",
      password: "haruharu",
      password_confirmation: "haruharu",
      introduction: "ここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入ります
                    ここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入ります
                    ここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入ります
                    ここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入ります
                    ここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入ります
                    ここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入ります
                    ここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入ります",
      profile_image: open("./db/images/haru-face.png"),
      background_image: open("./db/images/haru-bg.jpg"),
      is_active: true
    },

    {
      id: 12,
      company_name: "T.C.C",
      kana_company_name: "トップクリエイトカンパニー",
      postal_code: "3450000",
      address: "埼玉県南埼玉郡宮代町345-34-3",
      phone_number: "34500000000",
      email: "tcc@example.com",
      password: "tcctcc",
      password_confirmation: "tcctcc",
      introduction: "ここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入ります
                    ここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入ります
                    ここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入ります
                    ここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入ります
                    ここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入ります
                    ここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入ります
                    ここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入ります",
      profile_image: open("./db/images/tcc-face.jpg"),
      background_image: open("./db/images/tcc-bg.jpg"),
      is_active: true
    },

    {
      id: 13,
      company_name: "useful生命保険相互会社",
      kana_company_name: "ユースフルセイメイソウゴホケンガイシャ",
      postal_code: "4560000",
      address: "愛知県名古屋市熱田区456-45-4",
      phone_number: "45600000000",
      email: "useful@example.com",
      password: "useful",
      password_confirmation: "useful",
      introduction: "ここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入ります
                    ここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入ります
                    ここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入ります
                    ここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入ります
                    ここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入ります
                    ここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入ります
                    ここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入りますここに企業紹介文が入ります",
      profile_image: open("./db/images/useful-face.jpg"),
      background_image: open("./db/images/useful-bg.jpg"),
      is_active: true
    }
  ]
)