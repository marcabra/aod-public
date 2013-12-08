class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.references :region
      t.references :topic
      t.text :title
      t.text :description
      t.text :location
      t.string :started_at
      t.string :ended_at
      t.string :duration
      t.string :aid_kind
      t.string :aid_via
      t.text :odm
      t.text :meta_odm
      t.string :beneficiaries_kind
      t.integer :beneficiaries_count
      t.integer :beneficiaries_women
      t.text :result
      t.string :intervention_number
      t.string :internal_code

      t.timestamps
    end
    add_index :projects, :region_id
    add_index :projects, :topic_id
    add_index :projects, :title
  end
end
