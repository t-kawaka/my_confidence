class Point < ApplicationRecord
  belongs_to :task
  validates :name, presence: true
end
