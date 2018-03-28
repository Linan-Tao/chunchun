module Entities
  class Order < OrderSimple
    expose :logs, using: Entities::OrderLog, documentation: { is_array: true, desc: '订单流程' }
  end
end
