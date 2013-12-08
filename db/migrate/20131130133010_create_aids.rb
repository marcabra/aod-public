class CreateAids < ActiveRecord::Migration
  def change
    create_table :aids do |t|
      t.references :project
      t.references :agency
      t.integer :year
      t.decimal :committed_amount, precision: 12, scale: 2, default: 0
      t.decimal :paid_amount, precision: 12, scale: 2, default: 0

      t.timestamps
    end
    add_index :aids, :project_id
    add_index :aids, :agency_id
    add_index :aids, :year
  end
end
