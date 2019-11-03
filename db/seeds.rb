require "csv"

items_csv = CSV.readlines("db/items.csv")
items_csv.each do |row|
  Item.create(id: row[0], title: row[1], tag: [2], cr_item: row[3], item: row[4], created_at: row[5], updated_at: row[6], dl_id: row[7], suggest: row[8], tag2: row[9], tag3: row[10], tag4: row[11], tag5: row[12], tag6: row[13], tag7: row[14], tag8: row[15], tag9: row[16], tag10: row[17]) 
 end