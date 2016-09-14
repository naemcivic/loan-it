class ChangeUseableToUsableInIncidentReportModel < ActiveRecord::Migration[5.0]
  def change
  	rename_column :incident_reports, :usable, :usable
  end
end
