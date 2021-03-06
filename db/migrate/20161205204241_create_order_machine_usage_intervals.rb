class CreateOrderMachineUsageIntervals < ActiveRecord::Migration[5.0]
  def change
    create_table :order_machine_usage_intervals do |t|
      t.references :order_machine_usage, foreign_key: true, null: false
      t.integer :row_order, null: false
      t.integer :workers, null: false, default: 1

      t.timestamps
    end

    add_index :order_machine_usage_intervals, [:order_machine_usage_id, :row_order], unique: true, name: :omu_intervals_idx
  end
end
