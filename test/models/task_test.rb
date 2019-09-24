# == Schema Information
#
# Table name: tasks
#
#  id           :bigint           not null, primary key
#  title        :string(30)       not null
#  description  :text             not null
#  start_time   :datetime         not null
#  notice       :text
#  require_time :integer          not null
#  progress     :string           default("開始"), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint
#

require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
