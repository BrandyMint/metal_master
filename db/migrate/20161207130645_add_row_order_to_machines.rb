class AddRowOrderToMachines < ActiveRecord::Migration[5.0]
  def change
    add_column :machines, :row_order, :integer
  end
end
