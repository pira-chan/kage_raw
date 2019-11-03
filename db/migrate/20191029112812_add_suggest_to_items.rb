class AddSuggestToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :suggest, :text
  end
end
