User.create!(
  [
    {
      id: 1,
      last_name: "青山",
      first_name: "和久",
      kana_last_name: "アオヤマ",
      kana_first_name: "カズヒサ",
      postal_code: "1111111",
      address: "東京都千代田区丸の内１丁目",
      phone_number: "11111111111",
      email: "aoyama@email.com",
      password: "aoyama",
      password_confirmation: "aoyama",
      is_active: true,
      profile_image_id: open("./db/images/青山和久.jpg")
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
      email: "okazaki@email.com",
      password: "okazaki",
      password_confirmation: "okazaki",
      is_active: true,
      profile_image_id: open("./db/images/岡崎瞳.png")
    }
  ]
)


