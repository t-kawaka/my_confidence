class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user

  validates :body, presence: true
  validates_presence_of :body, :conversation_id, :user_id
end
