class AddMemberNoToPerson < ActiveRecord::Migration[4.2]
  def change
    add_column :people, :member_no, :string
  end
end
