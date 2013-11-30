class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :code
      t.string :name
      t.string :ancestry

      t.timestamps
    end
    add_index :topics, :code
    add_index :topics, :ancestry
  end
end
