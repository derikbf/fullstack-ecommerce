# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb

# Create Admin User
Admin.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') unless Admin.exists?(email: 'admin@example.com')

# Categories
electronics = Category.create!(name: 'Electronics', description: 'Electronic gadgets and devices.')
clothing = Category.create!(name: 'Clothing', description: 'Wearable items and accessories.')

# Products
laptop = Product.create!(name: 'Laptop', description: 'A portable computer.', price: 1200, category: electronics, active: true)
tshirt = Product.create!(name: 'T-Shirt', description: 'A cotton shirt.', price: 20, category: clothing, active: true)

# Stocks
Stock.create!(size: 'N/A', amount: 10, product: laptop)
Stock.create!(size: 'M', amount: 50, product: tshirt)
Stock.create!(size: 'L', amount: 50, product: tshirt)

# Orders
order1 = Order.create!(customer_email: 'customer@example.com', fulfilled: false, total: 1240, address: '123 Fake St.')

# OrderProducts
OrderProduct.create!(product: laptop, order: order1, size: 'N/A', quantity: 1)
OrderProduct.create!(product: tshirt, order: order1, size: 'M', quantity: 2)
