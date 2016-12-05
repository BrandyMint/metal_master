class CreateOrderMachineUsages < ActiveRecord::Migration[5.0]
  def change
    create_table :order_machine_usages do |t|
      t.references :order, foreign_key: true
      t.references :machine, foreign_key: true

      t.timestamps
    end

    add_index :order_machine_usages, [:order_id, :machine_id], unique: true
  end
end
