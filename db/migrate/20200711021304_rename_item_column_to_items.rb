class RenameItemColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :item, :dl_item
  end
end
