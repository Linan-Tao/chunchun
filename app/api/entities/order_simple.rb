module Entities
  class OrderSimple < Base
    expose_id
    expose :code, documentation: { desc: '订单号' }
    expose :status, documentation: { desc: '状态' }
    expose :catalog, using: Entities::Catalog, documentation: { is_array: true, desc: '维修类别' }
    expose :tag_list, documentation: { desc: '故障类型' }
    expose :predict_price, documentation: { desc: '预计维修金额' }
    expose :service_time, documentation: { desc: '预约上门时间' }
    expose :contact_address_line, documentation: { desc: '上门维修地址' }
    expose_created_at
    expose :assigned_at, documentation: {desc: '派单时间'}
    expose :note, documentation: { desc: '订单备注' }

    def assigned_at
      object.logs.where(log_type: 'assigned').last.created_at.to_i if object.logs.where(log_type: 'assigned').any?
    end
  end
end