class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.string      :name
      t.text        :image
      t.text        :text
      t.bigint        :status
      t.bigint        :created_item_id
      t.timestamps
    end
  end
end
