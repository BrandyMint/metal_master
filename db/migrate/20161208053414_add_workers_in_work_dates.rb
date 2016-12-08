class AddWorkersInWorkDates < ActiveRecord::Migration[5.0]
  def change
    add_column :work_dates, :workers, :integer, default: 0, null: false
  end
end
