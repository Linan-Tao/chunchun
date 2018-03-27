json.extract! product, :id, :name, :price, :images, :description, :content, :features, :created_at, :updated_at
json.url product_url(product, format: :json)
