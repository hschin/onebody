class AddChineseNameToPerson < ActiveRecord::Migration[4.2]
  def change
    add_column :people, :chinese_name, :string
  end
end
