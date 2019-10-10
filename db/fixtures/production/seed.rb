
  User.seed(
    :id,
    { id: 1, name: Gimei.kanji, email: 'user_admin@gmail.com', password: 'password', admin: true },
    { id: 2, name: Gimei.kanji, email: Faker::Internet.email, password: 'password' },
    { id: 3, name: Gimei.kanji, email: Faker::Internet.email, password: 'password' },
    { id: 4, name: Gimei.kanji, email: Faker::Internet.email, password: 'password' },
    { id: 5, name: Gimei.kanji, email: Faker::Internet.email, password: 'password' },
    { id: 6, name: Gimei.kanji, email: Faker::Internet.email, password: 'password' },
    { id: 7, name: Gimei.kanji, email: Faker::Internet.email, password: 'password' },
    { id: 8, name: Gimei.kanji, email: Faker::Internet.email, password: 'password' },
    { id: 9, name: Gimei.kanji, email: Faker::Internet.email, password: 'password' },
    { id: 10, name: Gimei.kanji, email: Faker::Internet.email, password: 'password' },
    { id: 11, name: Gimei.kanji, email: Faker::Internet.email, password: 'password' },
    { id: 12, name: Gimei.kanji, email: Faker::Internet.email, password: 'password' },
    { id: 13, name: Gimei.kanji, email: Faker::Internet.email, password: 'password' },
    { id: 14, name: Gimei.kanji, email: Faker::Internet.email, password: 'password' },
    { id: 15, name: Gimei.kanji, email: Faker::Internet.email, password: 'password' },
    { id: 16, name: Gimei.kanji, email: Faker::Internet.email, password: 'password' },
    { id: 17, name: Gimei.kanji, email: Faker::Internet.email, password: 'password' },
    { id: 18, name: Gimei.kanji, email: Faker::Internet.email, password: 'password' },
    { id: 19, name: Gimei.kanji, email: Faker::Internet.email, password: 'password' },
    id: 20, name: Gimei.kanji, email: Faker::Internet.email, password: 'password')

    Task.seed(
    :id,
    { id: 1, user_id: 1, title: 'BasicTitle', description: 'BasicContent', start_time: DateTime.now - 1, require_time: Random.rand(100), progress: '開始' },
    { id: 2, user_id: 3, title: 'BasicTitle2', description: 'BasicContent2', start_time: DateTime.now - 2, require_time: Random.rand(100), progress: '開始' },
    { id: 3, user_id: 1, title: 'BasicTitle3', description: 'BasicContent3', start_time: DateTime.now - 3,require_time: Random.rand(100), progress: '開始' },
    { id: 4, user_id: 2, title: 'BasicTitle4', description: 'BasicContent4', start_time: DateTime.now - 4,require_time: Random.rand(100), progress: '途中' },
    { id: 5, user_id: 7, title: 'BasicTitle5', description: 'BasicContent5', start_time: DateTime.now - 5, require_time: Random.rand(100), progress: '開始' },
    { id: 6, user_id: 8, title: 'BasicTitle6', description: 'BasicContent6', start_time: DateTime.now - 6, require_time: Random.rand(100), progress: '開始' },
    { id: 7, user_id: 10, title: 'BasicTitle7', description: 'BasicContent7', start_time: DateTime.now - 7, require_time: Random.rand(100), progress: '途中' },
    { id: 8, user_id: 1, title: 'BasicTitle8', description: 'BasicContent8', start_time: DateTime.now - 7, require_time: Random.rand(100), progress: '開始' },
    { id: 9, user_id: 1, title: 'BasicTitle9', description: 'BasicContent9', start_time: DateTime.now - 7, require_time: Random.rand(100), progress: '途中' },
    { id: 10, user_id: 1, title: 'BasicTitle10', description: 'BasicContent10', start_time: DateTime.now - 7, require_time: Random.rand(100), progress: '開始' },
    { id: 11, user_id: 1, title: 'BasicTitle11', description: 'BasicContent11', start_time: DateTime.now - 2, require_time: Random.rand(100), progress: '開始' },
    { id: 12, user_id: 4, title: 'BasicTitle12', description: 'BasicContent12', start_time: DateTime.current, require_time: Random.rand(100), progress: '開始' }
  )

    Point.seed(
    :id,
    { id: 1, user_id: 1, name: '成果物作成に取り組む' },
    { id: 2, user_id: 2, name: 'Rails勉強中' },
    { id: 3, user_id: 3, name: 'PHP勉強中' },
    { id: 4, user_id: 4, name: 'Java勉強中' }
    )

    Comment.seed(
    :id,
    { id: 1, user_id: 1, task_id: 1, content: 'ただいまコメント中' },
    { id: 2, user_id: 2, task_id: 3, content: 'コメントその2' },
    { id: 3, user_id: 1, task_id: 3, content: 'コメントその2' }
    )

    TaskFavorite.seed(
    :id,
    { id: 1, user_id: 1, task_id: 4 },
    { id: 2, user_id: 2, task_id: 1 },
    { id: 3, user_id: 5, task_id: 2 },
    { id: 4, user_id: 7, task_id: 1 },
    { id: 5, user_id: 6, task_id: 5 }
    )

    Tag.seed(
    :id,
    { id: 1, user_id: 1, name: 'ruby' },
    { id: 2, user_id: 1, name: 'Rails' },
    { id: 3, user_id: 1, name: 'PHP' },
    { id: 4, user_id: 2, name: 'Go' },
    { id: 5, user_id: 2, name: 'Python' },
    { id: 6, user_id: 3, name: 'Java' },
    { id: 7, user_id: 3, name: 'jquery' },
    { id: 8, user_id: 4, name: 'vim' },
    )

    TaskTag.seed(
    :id,
    { id: 1, task_id: 1, tag_id: 1 },
    { id: 2, task_id: 1, tag_id: 2 },
    { id: 3, task_id: 2, tag_id: 3 },
    { id: 4, task_id: 2, tag_id: 4 },
    { id: 5, task_id: 3, tag_id: 5 },
    { id: 6, task_id: 3, tag_id: 6 },
    { id: 7, task_id: 4, tag_id: 7 },
    { id: 8, task_id: 4, tag_id: 8 }
    )

    Relationship.seed(
    :id,
    { id: 1, follower_id: 1, followed_id: 11 },
    { id: 2, follower_id: 1, followed_id: 12 },
    { id: 3, follower_id: 2, followed_id: 13 },
    { id: 4, follower_id: 2, followed_id: 14 },
    { id: 5, follower_id: 3, followed_id: 15 },
    { id: 6, follower_id: 3, followed_id: 16 },
    { id: 7, follower_id: 4, followed_id: 17 },
    { id: 8, follower_id: 4, followed_id: 18 }
    )