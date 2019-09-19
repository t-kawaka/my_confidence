require 'rails_helper'

RSpec.feature User, type: :model do
  it "ユーザー登録" do
  user = User.new(user:"test1", email: "tese1@gmail.com", password:"foobar")
  expect(user).to_to be_valid
end
