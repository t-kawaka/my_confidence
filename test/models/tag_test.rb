# == Schema Information
#
# Table name: tags
#
#  id         :bigint           not null, primary key
#  name       :string(30)       not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#

require 'test_helper'

class TagTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
