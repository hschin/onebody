class AddFieldsToDonations < ActiveRecord::Migration[4.2]
  def change
    add_column :donations, :name, :string
    add_money :donations, :amount
  end
end
