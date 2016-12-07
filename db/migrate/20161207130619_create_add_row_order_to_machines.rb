class CreateAddRowOrderToMachines < ActiveRecord::Migration[5.0]
  def change
    create_table :add_row_order_to_machines do |t|
      t.integer :row_order
      t.boolean :is_active, null: false, default: true

      t.timestamps
    end
  end
end
