# == Schema Information
#
# Table name: devices
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  group_name :string
#  group_id   :integer
#  assigned   :boolean
#

class Device < ApplicationRecord

	belongs_to :group

	has_many :incident_reports, ->() { order(created_at: :asc)}

	has_many :loans, ->() { order(created_at: :desc)}

	has_one :active_loan, ->() { where(active: true) }, class_name: Loan

	has_one :active_incident_report, ->() { where(useable: false) }, class_name: IncidentReport

	#validates :active_incident_reports, :length => { :maximum => 1 }

	has_many :users, through: :loans

  #scopes are ways to shorten commonly used queries.
	scope :broken, ->{joins(:incident_reports).where(incident_reports: {useable: false})}

	def loan_name
		active_loan.name
	end

	def device_group
		try(:group).try(:name) || "No Group"
	end

	def is_useable?
		true if (self.incident_reports.count != 0) && self.incident_reports.last[:useable]
	end


end
