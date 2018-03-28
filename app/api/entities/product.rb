module Entities
  class Product < ProductSimple
    expose_id
    expose :content, documentation: { desc: '产品详情' }
  end
end
