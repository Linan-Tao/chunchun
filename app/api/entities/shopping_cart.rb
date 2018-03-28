module Entities
  class ShoppingCart < Base
    expose_id
    expose :amount, documentation: { desc: '产品数量', type: Integer }
    expose :product, using: Entities::ProductSimple, if: lambda { |instance, options| (options[:includes] || []).include?(:product) }
    expose :display_price, documentation: { desc: '产品价格', type: Float}, as: :price

    def display_price
      object.price.to_f/100
    end

  end
end