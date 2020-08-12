class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.text :item_title
      t.text :suggest_tag
      t.text :adopt_tag
      t.timestamps
    end
  end
end
