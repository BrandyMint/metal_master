class AddRowOrderToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :row_order, :integer
    add_column :orders, :is_active, :boolean
  end
end
