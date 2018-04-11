module Entities
  class OrderSimple < Base
    expose_id
    expose :code, documentation: { desc: '订单号' }
    expose :display_status, as: :status, documentation: { desc: '状态' }
    expose :display_price, as: :price, documentation: { desc: '产品价格', type: Float}
    expose :order_products, using: Entities::OrderProduct, documentation: { is_array: true }

    expose_created_at

    def display_price
      object.price.to_f/100
    end

    def display_status
      ::Order::STATUS[object.status.to_sym]
    end

  end
end
