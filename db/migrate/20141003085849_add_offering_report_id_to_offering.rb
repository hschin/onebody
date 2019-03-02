class AddOfferingReportIdToOffering < ActiveRecord::Migration[4.2]
  def change
    add_column :offerings, :offering_report_id, :integer
  end
end
