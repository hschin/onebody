class AddMemberNoToPerson < ActiveRecord::Migration
  def change
    add_column :people, :member_no, :string
  end
end
