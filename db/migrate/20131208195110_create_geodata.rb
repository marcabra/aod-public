class CreateGeodata < ActiveRecord::Migration
  def change
    create_table :geodata do |t|
      t.text :the_geom
      t.string :iso_code
      t.string :name
      t.integer :region
      t.integer :subregion
      t.float :lon
      t.float :lat

      t.timestamps
    end
    add_index :geodata, :iso_code    
  end
end
