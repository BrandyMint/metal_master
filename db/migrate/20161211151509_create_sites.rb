class CreateSites < ActiveRecord::Migration[5.0]
  def up
    create_table :sites do |t|
      t.references :machine, foreign_key: true, null: false
      t.string :title, null: false

      t.timestamps
    end

    add_index :sites, [:machine_id, :title], unique: true

    reseed() # remove later
  end

  def down
    remove_column :order_machine_usages, :site_id
    drop_table :sites
  end

  private

  def reseed
    Machine.find_each do |m|
      m.sites.create! title: m.title
    end
  end
end
