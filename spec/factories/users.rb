# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string           default(""), not null
#  icon                   :string
#  admin                  :boolean          default(FALSE), not null
#

FactoryBot.define do
  factory :user do
    name { 'user1' }
    email { 'test1@gmail.com' }
    password { 'password' }
    password_confirmation { 'password' }
    icon { nil }
    admin { false }
  end
end
