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
        optional :status, type: String, values: ::Order::STATUS.keys.map(&:to_s), desc: '订单状态'
      end
      get do
        authenticate!
        orders = current_worker.orders
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
        order = current_worker.orders.find(params[:id])
        present order, with: Entities::Order
      end

      desc "师傅接单/师傅取消订单/订单结算" do
        success Entities::Order
      end
      params do
        requires :id, type: Integer, desc: '订单ID'
        requires :type, type: String, values: ['accept', 'cancel', 'contact_customer', 'settle'], desc: '订单修改的类型(师傅接单/师傅取消接单/师傅结算)'
        requires :note, type: String, desc: '备注信息'
        optional :price, type: Float, desc: '维修费用'
        optional :pay_type, type: String, values: ['online', 'offline'], desc: '支付方式(线上支付/线下支付)'
        optional :service_time, type: String, desc: '师傅确认上门服务时间'
        optional :materials, type: Array[JSON] do
          optional :id, type: Integer
          optional :price, type: Float
          optional :amount, type: Integer
          optional :name, type: String
          all_or_none_of :name, :price, :amount
        end
        all_or_none_of :price, :pay_type, :materials
      end
      put ':id' do
        authenticate!
        order = current_worker.orders.find(params[:id])
        case params[:type]
        when 'accept'
          order.status = 'worker_accept'
          log = order.logs.new(log_type: order.status, writer: current_worker, resource: current_worker, content: params[:note])
          if order.save
            SmsService.send_sms(order.customer.mobile, message: ENV['SMS_CUSTOMER_AFTER_WORKER_ACCEPT_TEMPLATE'].gsub('#customer#', order.customer.name).gsub('#worker#', order.worker.name))
          end
        when 'cancel'
          order.status = 'unassigned'
          log = order.logs.new(log_type: 'worker_cancel', writer: current_worker, resource: current_worker, content: params[:note])
          order.save
        when 'contact_customer'
          order.status = 'contact_customer'
          order.service_time = params[:service_time]
          log = order.logs.new(log_type: 'contact_customer', writer: current_worker, resource: current_worker, content: params[:note])
          order.save
        when 'settle'
          order.status = 'confirm'
          params[:materials].each do |material|
            order.material_list.new(material_id: material[:id], price: material[:price] * 100, amount: material[:amount])
          end
          order.pay_type = params[:pay_type]
          log = order.logs.new(log_type: order.status, writer: current_worker, resource: current_worker, content: params[:note])
          order.price = params[:price] * 100
          order.worker_pay_price = (order.price - order.material_list.map{|m| m.price * m.amount}.sum()) * order.rebate_rate * 0.01
          order.save
        else
          error! '类型不正确'
        end
        present order, with: Entities::Order
      end
      
      desc '创建订单的charge'
      params do
        requires :id, type: Integer, desc: '订单ID'
        requires :channel, type: String, desc: '支付通道'
      end
      post ':id/charge' do
        authenticate!
        order = current_worker.orders.find_by(id: params[:id])
        case order.status
        when 'confirm'
          charge = PaymentCore.create_charge(
            order_no: order.code,
            channel: params[:channel],
            amount: order.worker_pay_price,
            client_ip: env['HTTP_X_REAL_IP'] || env['REMOTE_ADDR'],
            subject: "#{current_worker.name}师傅支付给平台",
            body: "#{current_worker.name}师傅支付给平台,订单号#{order.code}"
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
