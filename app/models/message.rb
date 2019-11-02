class Message < ApplicationRecord
  validates :body, presence: true
  belongs_to :conversation
  belongs_to :user
  validates_presence_of :body, :conversation_id, :user_id
end
