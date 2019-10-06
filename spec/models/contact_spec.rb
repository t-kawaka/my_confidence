require 'rails_helper'

RSpec.describe Contact, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end

  it 'お問い合わせ作成' do
    user = @user
    contact = Contact.new(title: 'お問い合わせタイトル', content: 'お問い合わせ内容', user_id: @user.id)
    expect(contact).to be_valid
  end

  it 'titleが未入力であった場合' do
    user = @user
    contact = Contact.new(title: nil, content: 'お問い合わせ内容', user_id: @user.id)
    expect(contact).to be_invalid
  end

  it 'contentが未入力であった場合' do
    user = @user
    contact = Contact.new(title: 'お問い合わせタイトル', content: nil, user_id: @user.id)
    expect(contact).to be_invalid
  end
end
