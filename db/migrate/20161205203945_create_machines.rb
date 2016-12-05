class CreateMachines < ActiveRecord::Migration[5.0]
  def change
    create_table :machines do |t|
      t.string :title, null: false, unique: true

      t.timestamps
    end
  end
end
