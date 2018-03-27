class Catalog < ApplicationRecord
  has_closure_tree dependent: :destroy
  def full_name
    if parent
      "#{parent.full_name}/#{name}"
    else
      "#{name}"
    end
  end

  def children_data
    children.as_json(only: [:id, :name], methods: [:children_data])
  end

end
