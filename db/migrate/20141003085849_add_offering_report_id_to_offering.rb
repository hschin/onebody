class AddOfferingReportIdToOffering < ActiveRecord::Migration
  def change
    add_column :offerings, :offering_report_id, :integer
  end
end
