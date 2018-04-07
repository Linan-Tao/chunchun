module Entities
  class ProductSimple < Base
    expose_id
    expose :name, documentation: { desc: '产品名称' }
    expose :description, documentation: { desc: '产品描述' }
    expose :price, documentation: { desc: '产品价格' }
    expose :sell_price, documentation: { desc: '产品卖价' }
    expose :stock, documentation: { desc: '产品库存' }
    expose :tag_list, documentation: { desc: '产品标签' }
    expose :first_image, documentation: { desc: '产品主图' }
    expose :images, documentation: { desc: '产品图片' }
    expose :catalog, using: Entities::Catalog, documentation: { desc: '产品分类' }
  end
end
