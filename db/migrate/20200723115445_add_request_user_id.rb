class AddRequestUserId < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :user_id, :bigint
  end
end
