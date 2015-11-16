json.array!(@products) do |product|
  json.extract! product, :id, :name, :price, :quantity, :description, :brand, :rating, :catergory_id
  json.url product_url(product, format: :json)
end
