class Pictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.integer :favorite_id
      t.integer :comparison_id
      t.string :photo_url
      t.timestamps null: false
    end
  end
end
