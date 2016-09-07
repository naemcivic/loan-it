class IncidentReport < ApplicationRecord
  validates_presence_of :description
	belongs_to :device
  belongs_to :user

  # before_create :set_active_incident_report

  def self.useable
    where(useable: true)
  end

  def set_active_incident_report
    self.useable = true
  end

  def name
    try(:user).try(:name) || "No Name"
  end
end

