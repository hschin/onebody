class AddMembershipTransferDateToPerson < ActiveRecord::Migration
  def change
    add_column :people, :membership_transfer_date, :date
  end
end
