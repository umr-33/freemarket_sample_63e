# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

count = 1
CSV.foreach('db/categories.csv') do |row|
  if count == 1
    Category.create!(id: count, name: row[0])
    count += 1
  else
    #Category.find(count).destroy if count < 358
    Category.create!(id: count, name: row[0], parent_id: row[1])
    count += 1
  end
end