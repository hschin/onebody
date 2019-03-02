class RenameDonationTypeInOfferings < ActiveRecord::Migration[4.2]
  def change
    rename_column :offerings, :donation_type, :offering_type
  end
end
