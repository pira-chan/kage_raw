class AddRequestIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :request_id, :bigint
  end
end
