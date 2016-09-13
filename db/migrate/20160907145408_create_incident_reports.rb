class CreateIncidentReports < ActiveRecord::Migration[5.0]
  def change
    create_table :incident_reports do |t|
      t.text :description
      t.boolean :usable

      t.timestamps
    end
  end
end
