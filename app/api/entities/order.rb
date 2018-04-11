module Entities
  class Order < OrderSimple
    expose :delivery_username, documentation: { desc: '联系方式' }
    expose :delivery_address, documentation: { desc: '收货地址' }
  end
end
