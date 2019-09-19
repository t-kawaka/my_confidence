require 'rails_helper'

RSpec.describe Tag, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end

  it "現在重点的に取り組んでいること" do
    user = @user
    tag = Tag.new(name: "プログラミング", user_id: @user.id)
    expect(tag).to be_valid
  end

  it "nameが未入力であった場合" do
    user = @user
    tag = Tag.new(name: nil, user_id: @user.id)
    expect(tag).to be_invalid
  end
end
