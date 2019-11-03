# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"

items_csv = CSV.readlines("db/items.csv")
items_csv.each do |row|
  Item.create(title: row[1], cr_item: row[2], item: row[5], created_at: row[6], updated_at: row[7], dl_id: row[8], sugest: row[9], tag2: row[10], tag3: row[11], tag4: row[12], tag5: row[13], tag6: row[14], tag7: row[15], tag8: row[16], tag9: row[17])
end