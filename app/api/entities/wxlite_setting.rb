module Entities
  class WxliteSetting < Base
    expose :delivery_fee, documentation: { desc: '运费' }
    expose :banners, documentation: { desc: '首页图' }
    expose :display_catalogs, as: :catalogs, using: Entities::Catalog, documentation: { desc: '首页分类' }
    expose :my_banner, documentation: { desc: '我的页面banner图' }

    def display_catalogs
      ::Catalog.where(id: object.catalogs)
    end
  end
end