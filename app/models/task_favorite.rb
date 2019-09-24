# == Schema Information
#
# Table name: task_favorites
#
#  id         :bigint           not null, primary key
#  user_id    :integer
#  task_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TaskFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :task
end
