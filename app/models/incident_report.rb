# == Schema Information
#
# Table name: incident_reports
#
#  id          :integer          not null, primary key
#  description :text
#  usable     :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  device_id   :integer
#

class IncidentReport < ApplicationRecord
  validates_presence_of :description
	belongs_to :device
  belongs_to :user

  #before_create :set_active_incident_report

  def self.usable
    where(usable: true)
  end

  def set_active_incident_report
    self.usable = true
  end

  def name
    try(:user).try(:name) || "No Name"
  end
end

