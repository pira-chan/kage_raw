class CreateItemSuggests < ActiveRecord::Migration[5.2]
  def change
    create_table :item_suggests do |t|
      t.references :item, foreign_key: true
      t.references :suggest, foreign_key: true

      t.timestamps
    end
  end
end
