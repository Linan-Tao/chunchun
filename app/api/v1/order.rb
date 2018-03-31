module V1
  class Order < Base
    helpers SharedParams
    resources :orders do
      desc '订单列表' do
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

      desc '订单详细' do
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

      desc '订单创建' do
        success Entities::Order
      end
      params do
        requires :shopping_cart_ids, type: Array[Integer], coerce_with: ->(val) { val.split(/,|，/).map(&:to_i) }, desc: '购物车ID列表'
        optional :address_book_id, type: Integer, desc: '地址薄ID'
      end
      post do
        authenticate!
        order = current_visitor.orders.new
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
        # if Settings.project.imolin?
        #   order.price = order.price + site.delivery_fee.to_f
        #   order.delivery_fee = site.delivery_fee
        # end
        if params[:address_book_id]
          address_book = current_visitor.address_books.find_by(id: params[:address_book_id])
          unless address_book.blank?
            order.delivery_username = address_book.name
            order.delivery_phone = address_book.mobile
            order.delivery_address = address_book.detail_address
          end
        end
        # binding.pry
        order.code = Time.now.to_i.to_s
        error! order.errors unless order.save && shopping_carts.destroy_all
        query_parts = {
          'appid' => ENV['WECHAT_LITE_APPID'],
          'mch_id' => ENV['WECHAT_MCH_ID'],
          'nonce_str' => SecureRandom.hex(13),
          'body' => '购买商品',
          'out_trade_no' => order.code,
          'total_fee' => order.price,
          'spbill_create_ip' => '127.0.0.1',
          'trade_type' => 'JSAPI',
          'notify_url' => ENV['SITE_HOST'],
          'openid' => current_visitor.uid
        }
        query_parts['sign'] = get_signature(query_parts)
        query_parts = query_parts.to_json
        xml_query = ActiveSupport::JSON.decode(query_parts).to_xml(root: 'xml', dasherize: false)
        resp = Faraday.post('https://api.mch.weixin.qq.com/pay/unifiedorder', xml_query)
        # query_str = encode_parameters(query_parts)
        # client = Faraday.new("https://api.mch.weixin.qq.com/pay/unifiedorder")
        # j = JSON.parse(resp.body)
        prepay = Hash.from_xml(resp.body)

        present prepay['xml']
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
