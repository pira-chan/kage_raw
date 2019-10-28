class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      
      t.string      :title
      t.text        :tag
      t.text        :cr_item
      t.text        :item
      t.timestamps null: true
    end
  end
end
