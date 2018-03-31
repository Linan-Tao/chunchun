# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  visitor_id :integer
#  code       :string
#  price      :integer
#  status     :string
#  features   :jsonb
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
