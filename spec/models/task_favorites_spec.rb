require 'rails_helper'

RSpec.describe TaskFavorite, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @task = Task.create(title: 'アクション作成', description: 'アクション詳細', start_time: Date.current , require_time:10, progress: '開始', user_id: @user.id)
  end

  it '投稿内容の「いいね！」設定' do
    taskfavorite = TaskFavorite.new(
      user_id: @user.id,
      task_id: @task.id
    )
    taskfavorite.valid?
    expect(taskfavorite).to be_valid
  end
end
