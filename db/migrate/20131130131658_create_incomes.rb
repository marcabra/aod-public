class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|
      t.references :region
      t.integer :year
      t.string :code
      t.string :name

      t.timestamps
    end
    add_index :incomes, :region_id
  end
end
