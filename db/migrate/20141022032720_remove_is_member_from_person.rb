class RemoveIsMemberFromPerson < ActiveRecord::Migration[4.2]
  def change
    remove_column :people, :is_member
  end
end
