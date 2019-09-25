# == Schema Information
#
# Table name: task_tags
#
#  id         :bigint           not null, primary key
#  task_id    :integer
#  tag_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TaskTag < ApplicationRecord
  belongs_to :tag
  belongs_to :task
end
