# == Schema Information
#
# Table name: wxlite_settings
#
#  id           :integer          not null, primary key
#  banners      :string           is an Array
#  delivery_fee :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class WxliteSetting < ApplicationRecord
end
