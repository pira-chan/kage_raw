class RenameImageColumnToRequests < ActiveRecord::Migration[5.2]
  def change
    rename_column :requests, :image, :request_pic
  end
end
