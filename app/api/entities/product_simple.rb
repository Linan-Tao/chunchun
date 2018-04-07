module Entities
  class ProductSimple < Base
    expose_id
    expose :name, documentation: { desc: '产品名称' }
    expose :description, documentation: { desc: '产品描述' }
    expose :display_price, as: :price, documentation: { desc: '产品价格' }
    expose :display_sell_price, as: :sell_price, documentation: { desc: '产品卖价' }
    expose :stock, documentation: { desc: '产品库存' }
    expose :tag_list, documentation: { desc: '产品标签' }
    expose :first_image, documentation: { desc: '产品主图' }
    expose :images, documentation: { desc: '产品图片' }
    expose :catalog, using: Entities::Catalog, documentation: { desc: '产品分类' }

    def display_price
      object.price.to_f / 100
    end  
    def display_sell_price
      object.sell_price.to_f / 100
    end  
  end
end
