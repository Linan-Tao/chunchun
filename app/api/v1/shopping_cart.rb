module V1
  class ShoppingCart < Base
    helpers SharedParams
    resources :shopping_carts do

      desc "添加产品到购物车" do
        success Entities::ShoppingCart
      end
      params do
        requires :product_id, type: Integer, desc: '产品ID'
        requires :amount, type: Integer, desc: '产品数量'
      end
      post do
        authenticate!
        product = ::Product.find_by(id: params[:product_id])
        error! '该产品不存在' unless product
        shopping_cart = current_visitor.shopping_carts.find_or_initialize_by(product_id: params[:product_id])
        if shopping_cart.new_record?
          shopping_cart.amount = params[:amount]
        else
          shopping_cart.amount += params[:amount]
        end
        shopping_cart.price = product.sell_price * shopping_cart.amount
        error! shopping_cart.errors unless shopping_cart.save
        present shopping_cart, with: Entities::ShoppingCart
      end

      desc "修改购物车产品" do
        success Entities::ShoppingCart
      end
      params do
        requires :product_id, type: Integer, desc: '产品ID'
        requires :amount, type: Integer, desc: '产品数量'
      end
      put do
        authenticate!
        product = ::Product.find_by(id: params[:product_id])
        error! '该产品不存在' unless product
        shopping_cart = current_visitor.shopping_carts.find_by(product_id: params[:product_id])
        error! '没有找到购物车记录' unless shopping_cart
        shopping_cart.price = product.sell_price * params[:amount]
        shopping_cart.amount =  params[:amount]
        error! shopping_cart.errors unless shopping_cart.save
        present shopping_cart, with: Entities::ShoppingCart
      end

      desc "从购物车中删除产品" do
        success Entities::ShoppingCart
      end
      params do
        requires :id, type: Integer, desc: '购物车ID'
      end
      delete do
        authenticate!
        shopping_cart = current_visitor.shopping_carts.find(params[:id]).destroy
        present shopping_cart, with: Entities::ShoppingCart
      end

      desc '获取购物车列表' do
        success Entities::ShoppingCart.collection
      end
      params do
        use :pagination
        use :sort, fields: [:id, :created_at, :updated_at]
        optional :ids, type: Array[Integer], coerce_with: ->(val) { val.split(/,|，/).map(&:to_i) }, desc: '购物车ID列表'
      end
      get do
        authenticate!
        shopping_carts = current_visitor.shopping_carts
        shopping_carts = shopping_carts.where(id: params[:ids]) if params[:ids]
        shopping_carts = paginate_collection(sort_collection(shopping_carts), params)
        wrap_collection shopping_carts, Entities::ShoppingCart, includes: [:product]
      end

    end # end of resources
  end
end
