require 'rails_helper'

RSpec.describe Conversation, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @user2 = User.create(name: 'user2', email: 'test2@gmail.com', password: 'password')
  end

  it 'メッセージ一覧 表示' do
    conversation = Conversation.new(
      sender_id: @user.id,
      recipient_id: @user2.id
    )
    conversation.valid?
    expect(conversation).to be_valid
  end
end
