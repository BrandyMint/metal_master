class CreateOrderMachineUsageIntervals < ActiveRecord::Migration[5.0]
  def change
    create_table :order_machine_usage_intervals do |t|
      t.references :order_machine_usage, foreign_key: true, null: false
      t.date :date, null: false
      t.integer :exchange, null: false, default: 1
      t.integer :workers, null: false, default: 1

      t.timestamps
    end

    add_index :order_machine_usage_intervals, [:order_machine_usage_id, :date, :exchange], unique: true, name: :omu_intervals_idx
  end
end
