require 'rails_helper'

RSpec.describe Task, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end

  it "本日のアクションの成果" do
    user = @user
    task = Task.new(title:"アクション作成", description: "アクション詳細", start_time: Date.current , require_time:10, progress:"開始", user_id: @user.id)
    expect(task).to be_valid
  end

  it "title（アクション内容）が未入力である場合" do
    user = @user
    task = Task.new(title:nil, description: "アクション詳細", start_time: Date.current , require_time:10, progress:"開始", user_id: @user.id)
    expect(task).to be_invalid
  end

  it "description（アクション詳細情報）が未入力である場合" do
    user = @user
    task = Task.new(title:"アクション作成", description: nil, start_time: Date.current , require_time:10, progress:"開始", user_id: @user.id)
    expect(task).to be_invalid
  end

  it "start_time（作成日時）が未入力である場合" do
    user = @user
    task = Task.new(title:"アクション作成", description: "アクション詳細", start_time: nil , require_time:10, progress:"開始", user_id: @user.id)
    expect(task).to be_invalid
  end

  it "start_time（作成日時）で明日以降に日にちを入力した場合" do
    user = @user
    task = Task.new(title:"アクション作成", description: "アクション詳細", start_time: Date.current+1 , require_time:10, progress:"開始", user_id: @user.id)
    expect(task).to be_invalid
  end

  it "require_time（取り組み時間）が未入力である場合" do
    user = @user
    task = Task.new(title:"アクション作成", description: "アクション詳細", start_time: Date.current , require_time:nil, progress:"開始", user_id: @user.id)
    expect(task).to be_invalid
  end

end
