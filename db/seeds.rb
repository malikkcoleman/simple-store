require 'faker'
require "csv"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# counter = 1
# while counter <= 676
#   new_product = Product.create(
#                                 title: Faker::Commerce.product_name,
#                                 price: Faker::Commerce.price,
#                                 stock_quantity: Faker::Number.digit
#                               )

#   counter = counter + 1
# end

Product.destroy_all

Category.destroy_all

csv_file = Rails.root.join('db/products.csv')
csv_data = File.read(csv_file)

products = CSV.parse(csv_data, headers: true)

# If CSV was created by Excel in Windows you may also need to set an encoding type:
# products = CSV.parse(csv_data, headers: true, encoding: 'iso-8859-1')

products.each do |product|
  print(product["category"])
  category = Category.find_or_create_by(name: product["category"])
  print(category.id)
  new_product = Product.create(
                                title: product["name"],
                                price: product["price"],
                                stock_quantity: product["stock_quantity"],
                                category_id: category.id
                              )


  # counter = counter + 1

  # Create categories and products here.

end



