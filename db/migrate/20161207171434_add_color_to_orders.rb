class AddColorToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :color, :string, default: '#dff0d8'
  end
end
