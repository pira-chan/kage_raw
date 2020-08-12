class CreateSuggests < ActiveRecord::Migration[5.2]
  def change
    create_table :suggests do |t|
      t.text :item_title
      t.text :suggest_tag
      t.timestamps
    end
  end
end
