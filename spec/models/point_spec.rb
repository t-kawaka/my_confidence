# == Schema Information
#
# Table name: points
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  task_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#

require 'rails_helper'

RSpec.describe Point, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end

  it "現在重点的に取り組んでいること" do
    user = @user
    point = Point.new(name:"成果物作成", user_id: @user.id)
    expect(point).to be_valid
  end

  it "nameが未入力であった場合" do
    user = @user
    point = Point.new(name:nil, user_id: @user.id)
    expect(point).to be_invalid
  end
end
