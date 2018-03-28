module Entities
  class Catalog < Base
    expose_id
    expose :name, documentation: { desc: '名称' }
    with_options if: ->(catalog, options) { options[:type] == :all_catalog } do |f|
      expose :children_data, documentation: { desc: '子分类', type: Hash }
    end
  end
end
