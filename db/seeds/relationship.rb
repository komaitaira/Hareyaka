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

    # 尾上・三菱
    {
      following_id: 5,
      follower_id: 2
    }
  ]
)