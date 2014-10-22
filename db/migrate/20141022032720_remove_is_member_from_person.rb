class RemoveIsMemberFromPerson < ActiveRecord::Migration
  def change
    remove_column :people, :is_member
  end
end
