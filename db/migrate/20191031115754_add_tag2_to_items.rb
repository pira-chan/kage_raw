class AddTag2ToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :tag2, :text
  end
end
