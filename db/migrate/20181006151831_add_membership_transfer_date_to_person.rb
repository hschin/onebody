class AddMembershipTransferDateToPerson < ActiveRecord::Migration[4.2]
  def change
    add_column :people, :membership_transfer_date, :date
  end
end
