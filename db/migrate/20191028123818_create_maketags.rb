class CreateMaketags < ActiveRecord::Migration[5.2]
  def change
    create_table :maketags do |t|
      t.text :suggest

      t.timestamps
    end
  end
end
