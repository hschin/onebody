class RenameDonationsToOfferings < ActiveRecord::Migration[4.2]
  def change
    rename_table :donations, :offerings
  end
end
