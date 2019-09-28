
  User.seed(
    :id,
    { id: 1, name: Faker::Creature::Animal.name, email: Faker::Internet.email, password: 'password'},
    { id: 2, name: Faker::Creature::Animal.name, email: Faker::Internet.email, password: 'password'},
    { id: 3, name: Faker::Creature::Animal.name, email: Faker::Internet.email, password: 'password'},
    { id: 4, name: Faker::Creature::Animal.name, email: Faker::Internet.email, password: 'password'},
    { id: 5, name: Faker::Creature::Animal.name, email: Faker::Internet.email, password: 'password'},
    { id: 6, name: Faker::Creature::Animal.name, email: Faker::Internet.email, password: 'password'},
    { id: 7, name: Faker::Creature::Animal.name, email: Faker::Internet.email, password: 'password'},
    { id: 8, name: Faker::Creature::Animal.name, email: Faker::Internet.email, password: 'password'},
    { id: 9, name: Faker::Creature::Animal.name, email: Faker::Internet.email, password: 'password'},
    id: 10, name: Faker::Creature::Animal.name, email: Faker::Internet.email, password: 'password')

    Task.seed(
    :id,
    { id: 1, user_id: 1, title: 'BasicTitle', description: 'BasicContent', start_time: DateTime.now - 1, require_time: 60, progress: "開始"},
    { id: 2, user_id: 3, title: 'BasicTitle2', description: 'BasicContent2', start_time: DateTime.now - 2, require_time: 60, progress: "開始" },
    { id: 3, user_id: 1, title: 'BasicTitle3', description: 'BasicContent3', start_time: DateTime.now - 3,require_time: 60, progress: "開始" },
    { id: 4, user_id: 2, title: 'BasicTitle4', description: 'BasicContent4', start_time: DateTime.now - 4,require_time: 60, progress: "開始" },
    { id: 5, user_id: 7, title: 'BasicTitle5', description: 'BasicContent5', start_time: DateTime.now - 5, require_time: 60, progress: "開始" },
    { id: 6, user_id: 8, title: 'BasicTitle6', description: 'BasicContent6', start_time: DateTime.now - 6, require_time: 60, progress: "開始" },
    { id: 7, user_id: 10, title: 'BasicTitle7', description: 'BasicContent7', start_time: DateTime.now - 7, require_time: 60, progress: "開始" },
    { id: 8, user_id: 1, title: 'BasicTitle8', description: 'BasicContent8', start_time: DateTime.now - 7, require_time: 60, progress: "開始" },
    { id: 9, user_id: 1, title: 'BasicTitle9', description: 'BasicContent9', start_time: DateTime.now - 7, require_time: 60, progress: "開始" },
    { id: 10, user_id: 1, title: 'BasicTitle10', description: 'BasicContent10', start_time: DateTime.now - 7, require_time: 60, progress: "開始" },
    id: 11, user_id: 1, title: 'BasicTitle11', description: 'BasicContent11', start_time: DateTime.now - 2, require_time: 60, progress: "開始"
  )

    Point.seed(
    :id,
    { id: 1, user_id: 1, name: "成果物作成に取り組む"},
    { id: 2, user_id: 2, name: "Rails勉強中"}
    )

    Comment.seed(
    :id,
    { id: 1, user_id: 1, task_id: 1, content: "ただいまコメント中"},
    { id: 2, user_id: 2, task_id: 3, content: "コメントその2"}
    )
