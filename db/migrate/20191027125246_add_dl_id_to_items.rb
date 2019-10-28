class AddDlIdToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :dl_id, :string
  end
end
