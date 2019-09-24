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

require 'test_helper'

class TaskTagTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
