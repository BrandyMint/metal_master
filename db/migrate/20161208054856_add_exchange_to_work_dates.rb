class AddExchangeToWorkDates < ActiveRecord::Migration[5.0]
  def change
    add_column :work_dates, :exchange, :integer, null: false, default: 1

    remove_column :work_dates, :is_business

    add_index :work_dates, [:date, :exchange], unique: true
    remove_index :work_dates, :date
  end
end
