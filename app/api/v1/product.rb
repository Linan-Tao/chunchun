module V1
  class Product < Base
    helpers SharedParams
    resources :products do

      desc "产品列表" do
        success Entities::ProductSimple
      end
      params do
        use :pagination
        use :sort, fields: [:id, :created_at, :updated_at]
        optional :catalog_id, type: Integer, desc: '分类ID'
        optional :keywords, type: String, desc: '名称/拼音查询'
      end
      get do
        # authenticate!
        if params[:catalog_id]
          catalog = ::Catalog.find(params[:catalog_id])
          products = ::Product.where(catalog: catalog.self_and_descendants)
        else
          products = ::Product.all
        end
        if params[:keywords]
          products = products.where("name ILIKE :key", { key: "%#{params[:keywords]}%" })
        end
        products = paginate_collection(products, params)
        wrap_collection products, Entities::ProductSimple
      end

      desc "产品详细" do
        success Entities::Product
      end
      params do
        requires :id, type: Integer, desc: '产品ID'
      end
      get ':id' do
        # authenticate!
        product = ::Product.find(params[:id])
        present product, with: Entities::Product
      end

    end # end of resources
  end
end
