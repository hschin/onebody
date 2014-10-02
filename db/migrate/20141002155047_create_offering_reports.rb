class CreateOfferingReports < ActiveRecord::Migration
  def change
    create_table :offering_reports do |t|
      t.date :report_date
      t.integer :monthly_cents
      t.integer :missions_cents
      t.integer :thanksgiving_cents
      t.integer :fundraising_cents
      t.integer :new_year_cents
      t.integer :christmas_cents
      t.integer :other_cents
      t.integer :total_cents

      t.timestamps
    end
  end
end
