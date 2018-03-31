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

class Visitor < ApplicationRecord
  attr_accessor :session_key
  has_many :shopping_carts
  has_many :orders
  has_many :address_books
end
