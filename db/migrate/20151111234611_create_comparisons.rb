class CreateComparisons < ActiveRecord::Migration
  def change
    create_table :comparisons do |t|

      t.timestamps null: false
    end
  end
end
