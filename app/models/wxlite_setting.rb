# == Schema Information
#
# Table name: wxlite_settings
#
#  id           :integer          not null, primary key
#  banners      :string           is an Array
#  delivery_fee :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  features     :jsonb
#

class WxliteSetting < ApplicationRecord
  # catalogs 首页类型数组
  store_accessor :features, :catalogs, :my_banner
end
