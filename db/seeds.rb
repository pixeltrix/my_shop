Product.find_or_create_by!(name: "Nike T-Shirt") do |p|
  p.description = "Men's T-Shirt in red"
  p.price       = "15.00"
end
