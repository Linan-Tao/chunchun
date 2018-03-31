module V1
  class Catalog < Base
    resources :catalogs do
      desc '分类列表' do
        success Entities::Catalog
      end
      params do
        optional :keywords, type: String, desc: '分类名称'
      end
      get do
        # authenticate!
        catalogs = ::Catalog.roots
        if params[:keywords].present?
          catalogs = catalogs.where('name ILIKE ?', "%#{params[:keywords]}%")
          present catalogs, with: Entities::Catalog
        else
          present catalogs, with: Entities::Catalog, type: :all_catalog
        end
      end
    end
  end
end
