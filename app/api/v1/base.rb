module V1
  class Base < RootAPI
    version 'v1', using: :path
    mount V1::Product
    mount V1::Catalog
    mount V1::Auth
    mount V1::ShoppingCart
    mount V1::AddressBook
    mount V1::Order
    mount V1::WxliteSetting
    mount V1::Charge
  end
end
