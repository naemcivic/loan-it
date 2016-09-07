class AddUserReferenceToIncidentReports < ActiveRecord::Migration[5.0]
  def change
  	add_column :incident_reports, :user_id, :integer
  end
end
