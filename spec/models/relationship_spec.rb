require 'rails_helper'

RSpec.describe Relationship, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @user2 = User.create(name: 'user2', email: 'test2@gmail.com', password: 'password')
  end

  it 'ユーザーへの「いいね！」設定' do
    relationship = Relationship.new(
      follower_id: @user.id,
      followed_id: @user2.id
    )
    relationship.valid?
    expect(relationship).to be_valid
  end
end
