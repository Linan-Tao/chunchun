module Entities
  class OrderSimple < Base
    expose_id
    expose :code, documentation: { desc: '订单号' }
    expose :status, documentation: { desc: '状态' }
    expose_created_at

  end
end