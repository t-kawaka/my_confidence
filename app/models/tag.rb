class Tag < ApplicationRecord
  has_many :task_tags, dependent: :destroy
  has_many :taggings, through: :task_tags
  validates :name, uniqueness: {scope: :user_id}, presence: true, length:{ maximum: 255}
end
