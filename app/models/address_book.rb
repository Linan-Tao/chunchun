# == Schema Information
#
# Table name: address_books
#
#  id             :integer          not null, primary key
#  visitor_id     :integer
#  name           :string
#  mobile         :string
#  province       :string
#  city           :string
#  district       :string
#  detail_address :string
#  features       :jsonb
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class AddressBook < ApplicationRecord
  belongs_to :visitor
end
