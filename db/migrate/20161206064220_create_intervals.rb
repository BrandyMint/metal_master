class CreateIntervals < ActiveRecord::Migration[5.0]
  def change
    create_table :intervals do |t|
      t.date :date, null: false
      t.integer :exchange, null: false

      t.timestamps
    end
    add_index :intervals, [:date, :exchange], unique: true
  end
end
