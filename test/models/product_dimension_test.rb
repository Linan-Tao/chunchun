# == Schema Information
#
# Table name: product_dimensions
#
#  id         :integer          not null, primary key
#  product_id :integer
#  name       :string
#  value      :string
#  price      :integer
#  stock      :integer
#  image      :string
#  features   :jsonb
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ProductDimensionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
