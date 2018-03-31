module Entities
  class AddressBook < Base
    expose_id
    expose :name, documentation: { desc: '名称' }
    expose :name, documentation: { desc: '收货人名字' }
    expose :mobile, documentation: { desc: '电话' }
    expose :province, documentation: { desc: '省' }
    expose :city, documentation: { desc: '市' }
    expose :district, documentation: { desc: '区' }
    expose :detail_address, documentation: { desc: '详细地址' }
  end
end
