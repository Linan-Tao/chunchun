module V1
  class Charge < Base
    format :xml
    content_type :xml, "text/xml"
    desc '支付成功回调'
    # params do

    # end

    post 'pay' do
      binding.pry
    end
  end
end