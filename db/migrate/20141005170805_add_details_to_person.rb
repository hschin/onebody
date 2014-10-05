class AddDetailsToPerson < ActiveRecord::Migration
  def change
    add_column :people, :is_member, :boolean
    add_column :people, :congregation, :string
    add_column :people, :baptism_date, :date
    add_column :people, :confirmation_date, :date
    add_column :people, :status, :string
  end
end
