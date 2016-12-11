class CreateSites < ActiveRecord::Migration[5.0]
  def up
    create_table :sites do |t|
      t.references :machine, foreign_key: true, null: false
      t.string :title, null: false
      t.integer :row_order

      t.timestamps
    end

    add_index :sites, [:machine_id, :title], unique: true

    reseed() # remove later
  end

  def down
    drop_table :sites
  end

  private

  def reseed
    Order.find_each do |o|
      o.update color: Order::COLORS.first
    end
    Machine.find_each do |m|
      m.sites.create! title: m.title
    end
  end
end
