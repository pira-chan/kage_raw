class AddTag3ToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :tag3, :text
    add_column :items, :tag4, :text
    add_column :items, :tag5, :text
    add_column :items, :tag6, :text
    add_column :items, :tag7, :text
    add_column :items, :tag8, :text
    add_column :items, :tag9, :text
    add_column :items, :tag10, :text
  end
end
