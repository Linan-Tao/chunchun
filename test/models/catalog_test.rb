# == Schema Information
#
# Table name: catalogs
#
#  id         :integer          not null, primary key
#  parent_id  :integer
#  name       :string
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class CatalogTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
