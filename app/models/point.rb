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

class Point < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
end
