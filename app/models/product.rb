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
#  is_deleted  :boolean          default(FALSE)
#
# Indexes
#
#  index_products_on_catalog_id  (catalog_id)
#
# Foreign Keys
#
#  fk_rails_...  (catalog_id => catalogs.id)
#

class Product < ApplicationRecord
  has_many :product_dimensions
  belongs_to :catalog
  acts_as_taggable
  store_accessor :features, :sell_price, :stock
  validates_presence_of :price, :sell_price, :name, :stock

  def first_image
    images ? images.first : 'http://p64xi7w31.bkt.clouddn.com/WechatIMG602.jpeg'
  end
end
