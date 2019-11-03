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
  Item.create(title: row[1], cr_item: row[2], item: row[3], created_at: row[4], updated_at: row[5], dl_id: row[6], sugest: row[7], tag2: row[8], tag3: row[9], tag4: row[10], tag5: row[11], tag6: row[12], tag7: row[13], tag8: row[14], tag9: row[15], tag10: row[16])
end