
  User.seed(
    :id,
    { id: 1, name: Faker::Games::Pokemon.name, email: Faker::Internet.email, password: 'password'},
    { id: 2, name: Faker::Games::Pokemon.name, email: Faker::Internet.email, password: 'password'},
    { id: 3,  name: Faker::Games::Pokemon.name, email: Faker::Internet.email, password: 'password'},
    { id: 4,  name: Faker::Games::Pokemon.name, email: Faker::Internet.email, password: 'password'},
    { id: 5,  name: Faker::Games::Pokemon.name, email: Faker::Internet.email, password: 'password'},
    { id: 6,  name: Faker::Games::Pokemon.name, email: Faker::Internet.email, password: 'password'},
    { id: 7,  name: Faker::Games::Pokemon.name, email: Faker::Internet.email, password: 'password'},
    { id: 8,  name: Faker::Games::Pokemon.name, email: Faker::Internet.email, password: 'password'},
    { id: 9,  name: Faker::Games::Pokemon.name, email: Faker::Internet.email, password: 'password'},
    id: 10, name: Faker::Games::Pokemon.name, email: Faker::Internet.email, password: 'password')

    Task.seed(
    :id,
    { id: 1, user_id: 1, title: 'BasicTeam', description: 'BasicTeam', start_time: DateTime.now - 1, require_time: 60, progress: "開始"},
    { id: 2, user_id: 3, title: 'BasicTeam', description: 'BasicTeam', start_time: DateTime.now - 1, require_time: 60, progress: "開始" },
    { id: 3, user_id: 1, title: 'BasicTeam', description: 'BasicTeam', start_time: DateTime.now - 1,require_time: 60, progress: "開始" },
    { id: 4, user_id: 2, title: 'BasicTeam', description: 'BasicTeam', start_time: DateTime.now - 1,require_time: 60, progress: "開始" },
    { id: 5, user_id: 7, title: 'BasicTeam', description: 'BasicTeam', start_time: DateTime.now - 1, require_time: 60, progress: "開始" },
    { id: 6, user_id: 8, title: 'BasicTeam', description: 'BasicTeam', start_time: DateTime.now - 1, require_time: 60, progress: "開始" },
    { id: 7, user_id: 10, title: 'BasicTeam', description: 'BasicTeam', start_time: DateTime.now - 1, require_time: 60, progress: "開始" },
    id: 8, user_id: 2, title: 'BasicTeam', description: 'BasicTeam', start_time: DateTime.now - 1, require_time: 60, progress: "開始"
  )