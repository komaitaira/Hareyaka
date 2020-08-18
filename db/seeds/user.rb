User.create!(
  [
    {
      id: 1,
      last_name: "青山",
      first_name: "和久",
      kana_last_name: "アオヤマ",
      kana_first_name: "カズヒサ",
      postal_code: "1111111",
      address: "東京都千代田区丸の内１丁目1-11-111",
      phone_number: "11111111111",
      email: "aoyama@example.com",
      password: "aoyama",
      password_confirmation: "aoyama",
      profile_image: open("./db/images/aoyama-face.jpg"),
      introduction: "最近資産運用について知りたいと思って勉強してます！",
      is_active: true
    },

    {
      id: 2,
      last_name: "岡崎",
      first_name: "瞳",
      kana_last_name: "オカザキ",
      kana_first_name: "ヒトミ",
      postal_code: "2222222",
      address: "滋賀県彦根市金剛寺町2-16ザ金剛寺町313",
      phone_number: "22222222222",
      email: "okazaki@example.com",
      password: "okazaki",
      password_confirmation: "okazaki",
      introduction: "健康食品にハマってます！",
      profile_image: open("./db/images/okazaki-face.png"),
      is_active: true
    },

    {
      id: 3,
      last_name: "白鳥",
      first_name: "蒼甫",
      kana_last_name: "シラトリ",
      kana_first_name: "ソウスケ",
      postal_code: "3333333",
      address: "東京都練馬区豊玉南4-11",
      phone_number: "33333333333",
      email: "shiratori@example.com",
      password: "shiratori",
      password_confirmation: "shiratori",
      introduction: "筋トレは最高！トレーニング方法とかもっと知りたい！",
      profile_image: open("./db/images/shiratori-face.jpg"),
      is_active: true
    },

    {
      id: 4,
      last_name: "猪俣",
      first_name: "竜也",
      kana_last_name: "イノマタ",
      kana_first_name: "タツヤ",
      postal_code: "4444444",
      address: "北海道千歳市千代田町2-3千代田町シティ102",
      phone_number: "44444444444",
      email: "inomata@example.com",
      password: "inomata",
      password_confirmation: "inomata",
      introduction: "プログラミングやってみようかなと思ってます！",
      profile_image: open("./db/images/inomata-face.jpeg"),
      is_active: true
    },

    {
      id: 5,
      last_name: "尾上",
      first_name: "洋子",
      kana_last_name: "オガミ",
      kana_first_name: "ヨウコ",
      postal_code: "5555555",
      address: "東京都小平市回田町2-12-17フォレスト回田町202",
      phone_number: "55555555555",
      email: "ogami@example.com",
      password: "ogamiogami",
      password_confirmation: "ogamiogami",
      introduction: "いろいろ化粧品を試してるけど自分に合ったものが見つからない。。
                      オススメあれば知りたいです！",
      profile_image: open("./db/images/ogami-face.jpg"),
      is_active: true
    },

    {
      id: 6,
      last_name: "村上",
      first_name: "薫",
      kana_last_name: "ムラカミ",
      kana_first_name: "カオル",
      postal_code: "0980000",
      address: "北海道天塩郡豊富町098-09-0",
      phone_number: "09800000000",
      email: "murakami@example.com",
      password: "murakami",
      password_confirmation: "murakami",
      introduction: "ファッションが大好きです！特にシンプルでキレイめな格好が好み！
                    新しい洋服買いたいなあ。何かおすすめあったら教えて欲しいです！",
      profile_image: open("./db/images/murakami-face.jpeg"),
      is_active: true
    },

    {
      id: 7,
      last_name: "中野",
      first_name: "優",
      kana_last_name: "ナカノ",
      kana_first_name: "ユウ",
      postal_code: "9870000",
      address: "宮城県遠田郡美里町987-87-7",
      phone_number: "98700000000",
      email: "nakano@example.com",
      password: "nakano",
      password_confirmation: "nakano",
      introduction: "最近は料理にハマっているんですが、もっとクオリティを高めたい。。アドバイスいただきたいです！",
      profile_image: open("./db/images/nakano-face.jpeg"),
      is_active: true
    },

    {
      id: 8,
      last_name: "坂本",
      first_name: "隆二",
      kana_last_name: "サカモト",
      kana_first_name: "リュウジ",
      postal_code: "8760000",
      address: "大分県佐伯市876-87-8",
      phone_number: "87600000000",
      email: "sakamoto@example.com",
      password: "sakamoto",
      password_confirmation: "sakamoto",
      introduction: "飲食店を経営する傍ら、土日は子供たちにサッカーを教えています。
                    子供をより成長させるために何か自分でも頑張りたいです。",
      profile_image: open("./db/images/sakamoto-face.jpg"),
      is_active: true
    },

    {
      id: 9,
      last_name: "黒川",
      first_name: "喜助",
      kana_last_name: "クロカワ",
      kana_first_name: "キスケ",
      postal_code: "7650000",
      address: "香川県善通寺市765-76-7",
      phone_number: "76500000000",
      email: "kurokawa@example.com",
      password: "kurokawa",
      password_confirmation: "kurokawa",
      introduction: "部下をよりうまく指導し、成長させるコツを教えていただきたいです。",
      profile_image: open("./db/images/kurokawa-face.jpeg"),
      is_active: true
    },

    {
      id: 10,
      last_name: "吉崎",
      first_name: "圭司",
      kana_last_name: "ヨシザキ",
      kana_first_name: "ケイジ",
      postal_code: "5430000",
      address: "大阪府大阪市天王寺区543-54-5",
      phone_number: "54300000000",
      email: "yoshizaki@example.com",
      password: "yoshizaki",
      password_confirmation: "yoshizaki",
      introduction: "資産運用が知りたい。。。",
      profile_image: open("./db/images/yoshizaki-face.jpg"),
      is_active: true
    },

    {
      id: 11,
      last_name: "田中",
      first_name: "由美",
      kana_last_name: "タナカ",
      kana_first_name: "ユミ",
      postal_code: "4320000",
      address: "静岡県浜松市中区432-43-4",
      phone_number: "43200000000",
      email: "tanaka@example.com",
      password: "tanaka",
      password_confirmation: "tanaka",
      introduction: "仕事と育児の両立って大変。。どうしたらうまくいくんだろう。アドバイスが欲しいです！",
      profile_image: open("./db/images/tanaka-face.jpeg"),
      is_active: true
    },

    {
      id: 12,
      last_name: "高坂",
      first_name: "大輝",
      kana_last_name: "コウサカ",
      kana_first_name: "ダイキ",
      postal_code: "4844444",
      address: "愛知県犬山市484-48-4",
      phone_number: "48488884444",
      email: "kosaka@example.com",
      password: "kosaka",
      password_confirmation: "kosaka",
      introduction: "今度起業したいと思っているので経営について学びたい！",
      profile_image: open("./db/images/kosaka-face.jpg"),
      is_active: true
    },

    {
      id: 13,
      last_name: "立花",
      first_name: "裕美",
      kana_last_name: "タチバナ",
      kana_first_name: "ヒロミ",
      postal_code: "5465444",
      address: "大阪府大阪市東住吉区546-45-4",
      phone_number: "54600000000",
      email: "tachibana@example.com",
      password: "tachibana",
      password_confirmation: "tachibana",
      introduction: "自分に合った化粧品を知りたいです。",
      profile_image: open("./db/images/tachibana-face.jpg"),
      is_active: true
    }
  ]
)


