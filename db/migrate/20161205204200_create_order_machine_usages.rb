class CreateOrderMachineUsages < ActiveRecord::Migration[5.0]
  def change
    create_table :order_machine_usages do |t|
      t.references :order, foreign_key: true
      t.references :machine, foreign_key: true
      t.integer :after_machine_usage_id, index: true
      t.string :start_condition, null: false
      t.integer :skip_steps

      t.timestamps
    end

    add_foreign_key :order_machine_usages, :order_machine_usages, column: :after_machine_usage_id

    add_index :order_machine_usages, [:order_id, :machine_id], unique: true
  end
end
