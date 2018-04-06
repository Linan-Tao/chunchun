# == Schema Information
#
# Table name: catalogs
#
#  id         :integer          not null, primary key
#  parent_id  :integer
#  name       :string
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_catalogs_on_parent_id  (parent_id)
#

class Catalog < ApplicationRecord
  has_closure_tree dependent: :destroy
  def full_name
    if parent
      "#{parent.full_name}/#{name}"
    else
      name.to_s
    end
  end

  def children_data
    children.as_json(only: [:id, :name], methods: [:children_data])
  end
end
