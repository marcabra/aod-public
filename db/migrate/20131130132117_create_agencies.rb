class CreateAgencies < ActiveRecord::Migration
  def change
    create_table :agencies do |t|
      t.string :name
      t.string :organism
      t.string :organism_kind

      t.timestamps
    end
    add_index :agencies, :name
  end
end
