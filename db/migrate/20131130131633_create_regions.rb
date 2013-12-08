class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string :name
      t.string :area
      t.string :iso_code
      t.timestamps
    end
    add_index :regions, :name
    add_index :regions, :iso_code
  end
end
