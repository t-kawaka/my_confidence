require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @task = Task.create(title:"アクション作成", description: "アクション詳細", start_time: Date.current , require_time:10, progress:"開始", user_id: @user.id)
  end

  it "現在重点的に取り組んでいること" do
    user = @user
    task = @task
    comment = Comment.new(content:"成果物作成", user_id: @user.id, task_id: @task.id)
    expect(comment).to be_valid
  end
end
