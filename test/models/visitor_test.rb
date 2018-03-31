# == Schema Information
#
# Table name: visitors
#
#  id         :integer          not null, primary key
#  uid        :string
#  nickname   :string
#  headshot   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class VisitorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
