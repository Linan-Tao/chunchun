# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string
#  price       :string
#  images      :string           is an Array
#  description :string
#  content     :text
#  features    :jsonb
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  catalog_id  :integer
#
# Indexes
#
#  index_products_on_catalog_id  (catalog_id)
#
# Foreign Keys
#
#  fk_rails_...  (catalog_id => catalogs.id)
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
