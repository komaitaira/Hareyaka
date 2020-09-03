Relationship.create!(
  [
    # 青山・三菱
    {
      following_id: 1,
      follower_id: 2
    },

    # 青山・セカンドリテイリング
    {
      following_id: 1,
      follower_id: 7
    },

    # 青山・グルメアソシエーションズ
    {
      following_id: 1,
      follower_id: 6
    },

    # 青山・ゲストカンパニー
    {
      following_id: 1,
      follower_id: 14
    },

    # 村上・三菱
    {
      following_id: 6,
      follower_id: 2
    },

    # 村上・セカンドリテイリング
    {
      following_id: 6,
      follower_id: 7
    },

    # 村上・ゲストカンパニー
    {
      following_id: 6,
      follower_id: 14
    },

    # 中野・三菱
    {
      following_id: 7,
      follower_id: 2
    },

    # 中野・セカンドリテイリング
    {
      following_id: 7,
      follower_id: 7
    },

    # 中野・グルメアソシエーションズ
    {
      following_id: 7,
      follower_id: 6
    },

    # 中野・光星
    {
      following_id: 7,
      follower_id: 3
    },

    # 中野・ゲストカンパニー
    {
      following_id: 7,
      follower_id: 14
    },

    # 尾上・三菱
    {
      following_id: 5,
      follower_id: 2
    },

    # 尾上・ゲストカンパニー
    {
      following_id: 5,
      follower_id: 14
    },

    # ゲストユーザー・三菱
    {
      following_id: 14,
      follower_id: 2
    },

    # ゲストユーザー・光星
    {
      following_id: 14,
      follower_id: 3
    },

    # ゲストユーザー・グルメアソシエーションズ
    {
      following_id: 14,
      follower_id: 6
    },

    # ゲストユーザー・セカンドリテイリング
    {
      following_id: 14,
      follower_id: 7
    },

    # ゲストユーザー・ゲストカンパニー
    {
      following_id: 14,
      follower_id: 14
    }
  ]
)