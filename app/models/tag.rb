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

class Tag < ApplicationRecord
  has_many :task_tags, dependent: :destroy
  has_many :taggings, through: :task_tags, source: :task
  belongs_to :user

  validates :name, uniqueness: { scope: :user_id }, presence: true, length:{ maximum: 255 }
end
