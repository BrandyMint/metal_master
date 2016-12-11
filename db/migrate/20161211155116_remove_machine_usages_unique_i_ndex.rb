class RemoveMachineUsagesUniqueINdex < ActiveRecord::Migration[5.0]
  def change
    remove_index :order_machine_usages, name: :index_order_machine_usages_on_order_id_and_machine_id
  end
end
