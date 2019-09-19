require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @task = FactoryBot.create(:task)
  end

  it "現在重点的に取り組んでいること" do
    user = @user
    task = @task
    comment = Comment.new(content:"成果物作成", user_id: @user.id, task_id: @task.id)
    expect(comment).to be_valid
  end
end
