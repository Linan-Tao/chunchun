module V1
  class Order < Base
    helpers SharedParams
    resources :orders do

      desc "订单列表" do
        success Entities::OrderSimple
      end
      params do
        use :pagination
        use :sort, fields: [:id, :created_at, :updated_at]
        optional :status, type: String
      end
      get do
        authenticate!
        orders = current_visitor.orders
        orders = orders.where(status: params[:status]) if params[:status]
        orders = paginate_collection(orders, params)
        wrap_collection orders, Entities::OrderSimple
      end

      desc "订单详细" do
        success Entities::Order
      end
      params do
        requires :id, type: Integer, desc: '订单ID'
      end
      get ':id' do
        authenticate!
        order = current_visitor.orders.find(params[:id])
        present order, with: Entities::Order
      end

      desc "订单创建" do
        success Entities::Order
      end
      params do
        requires :shopping_cart_ids, type: Array[Integer], coerce_with: ->(val) { val.split(/,|，/).map(&:to_i) }, desc: '购物车ID列表'
        optional :address_book_id, type: Integer, desc: '地址薄ID'
      end
      post do
        authenticate!
        order = current_user.orders.new
        shopping_carts = ::ShoppingCart.where(id: params[:shopping_cart_ids])
        error! '购物清单为空！' if shopping_carts.empty?
        shopping_carts.each do |sc|
          order.order_products.new(product_id: sc.product_id, price: sc.price, amount: sc.amount)
        end
        # 这里的修改是因为在order_product的model里面price已经被设置为产品价格和数量的乘积了，不要再改回去了
        # def set_default_price
        #   self.price ||= product.price * amount
        # end
        order.price = order.order_products.map(&:price).sum
        if Settings.project.imolin?
          order.price = order.price + site.delivery_fee.to_f
          order.delivery_fee = site.delivery_fee
        end
        if params[:address_book_id]
          address_book = current_user.address_books.find_by(id: params[:address_book_id])
          unless address_book.blank?
            order.delivery_username = address_book.name
            order.delivery_phone = address_book.mobile_phone
            order.delivery_address = address_book.full_address
          end
        end
        error! order.errors unless order.save && shopping_carts.destroy_all
        present order, with: Entities::Order
      end
      
      desc '创建订单的charge'
      params do
        requires :id, type: Integer, desc: '订单ID'
        requires :channel, type: String, desc: '支付通道'
      end
      post ':id/charge' do
        authenticate!
        order = current_visitor.orders.find_by(id: params[:id])
        case order.status
        when 'confirm'
          charge = PaymentCore.create_charge(
            order_no: order.code,
            channel: params[:channel],
            amount: order.worker_pay_price,
            client_ip: env['HTTP_X_REAL_IP'] || env['REMOTE_ADDR'],
            subject: "#{current_visitor.name}师傅支付给平台",
            body: "#{current_visitor.name}师傅支付给平台,订单号#{order.code}"
          )
          present charge: charge
        when 'paid'
          error! '请勿重复支付！'
        else
          error! '支付失败！'
        end
      end

    end
  end
end
