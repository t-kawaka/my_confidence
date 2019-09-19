require 'rails_helper'

RSpec.describe User, type: :model do
  it "ユーザー登録" do
    user = User.new(name:"test1", email: "test1@gmail.com", password:"password")
    expect(user).to be_valid
  end

  it "名前未入力" do
    user = User.new(name:nil, email: "test2@gmail.com", password:"password")
    expect(user).not_to be_valid
  end

  it "メールアドレス未入力" do
    user = User.new(name:"test3", email: nil, password:"password")
    expect(user).not_to be_valid
  end

  it "パスワード未入力" do
    user = User.new(name:"test4", email: "test4@gmail.com", password:nil)
    expect(user).not_to be_valid
  end

  it "パスワードの文字数が足りない" do
    user = User.new(name:"test5", email: "test5@gmail.com", password:"12345")
    expect(user).not_to be_valid
  end

  it "パスワードと確認用パスワードが一致しない" do
    user= User.new(name:"test6", email: "test6@gmail.com", password: "123456", password_confirmation: "1234567")
    expect(user).not_to be_valid
  end


  it "同じ名前が２つ以上ならバリデーションが通りfalseになる" do
    User.create(name: "user01", email: "user01@gmail.com", password: "password")
    user = User.new(name: "user01", email: "user02@gmail.com", password: "password")
    expect(user).not_to be_valid
  end

  it "同じメールアドレスが２つ以上ならバリデーションが通りfalseになる" do
    User.create(name: "user01", email: "user01@gmail.com", password: "password")
    user = User.new(name: "user02", email: "user01@gmail.com", password: "password")
    expect(user).not_to be_valid
  end
end
