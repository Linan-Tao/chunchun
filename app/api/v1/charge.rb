module V1
  class Charge < Base
    desc '支付成功回调'
    # params do

    # end

    get 'pay' do
      binding.pry
    end
  end
end