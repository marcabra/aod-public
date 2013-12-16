class AddReturnedAmountToAids < ActiveRecord::Migration
  def change
    add_column :aids, :returned_amount, :decimal, precision: 12, scale: 2, default: 0
  end
end
