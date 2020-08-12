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
    }
  ]
)


