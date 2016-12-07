class CreateWorkDates < ActiveRecord::Migration[5.0]
  def change
    create_table :work_dates do |t|
      t.date :date, null: false
      t.boolean :is_business, null: false, default: true

      t.timestamps
    end

    add_index :work_dates, [:date], unique: true
  end
end
