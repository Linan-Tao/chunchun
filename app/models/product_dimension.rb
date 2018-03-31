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

class ProductDimension < ApplicationRecord
  belongs_to :product
end
