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

require 'test_helper'

class PointTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
