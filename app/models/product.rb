class Product < ApplicationRecord
  has_many :product_dimensions
  belongs_to :catalog
  acts_as_taggable
  store_accessor :features, :sell_price, :stock

  def first_image
    images ? images.first : 'http://p64xi7w31.bkt.clouddn.com/WechatIMG602.jpeg'
  end
end
