# == Schema Information
#
# Table name: tags
#
#  id         :bigint           not null, primary key
#  name       :string(30)       not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#

require 'rails_helper'

RSpec.describe Tag, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end

  it '現在重点的に取り組んでいること' do
    user = @user
    tag = Tag.new(name: 'プログラミング', user_id: @user.id)
    expect(tag).to be_valid
  end

  it 'nameが未入力であった場合' do
    user = @user
    tag = Tag.new(name: nil, user_id: @user.id)
    expect(tag).to be_invalid
  end
end
