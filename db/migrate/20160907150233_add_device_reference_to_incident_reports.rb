class AddDeviceReferenceToIncidentReports < ActiveRecord::Migration[5.0]
  def change
  	add_column :incident_reports, :device_id, :integer
  end
end
