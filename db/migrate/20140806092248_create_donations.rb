class CreateDonations < ActiveRecord::Migration[4.2]
  def change
    create_table :donations do |t|
      t.date :date
      t.references :person, index: true
      t.references :family, index: true
      t.string :donation_type

      t.timestamps
    end
  end
end
