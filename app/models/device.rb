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

	validates_presence_of :name, :group_id

	belongs_to :group

	has_many :incident_reports, ->() { order(created_at: :asc)}

	has_many :loans, ->() { order(created_at: :desc)}

	has_one :active_loan, ->() { where(active: true) }, class_name: Loan

	has_one :active_incident_report, ->() { where(usable: false) }, class_name: IncidentReport

  has_many :users, through: :loans

  #scopes are ways to shorten commonly used queries.
	scope :broken, ->{joins(:incident_reports).where(incident_reports: {usable: false})}
	#scope :not_broken, ->{joins(:incident_reports).where.not(incident_reports: {usable: false}).uniq}
	scope :not_broken, ->{all.includes(:loans, :incident_reports).map { |device| device if device.incident_reports.empty? || device.incident_reports.last[:usable] }.compact}

	def loan_name
		active_loan.name
	end

	def device_group
		try(:group).try(:name) || "No Group"
	end

  def working_device_name
    incident_reports.empty? || with_incident_report_and_usable? ? name : nil
  end

  def broken_device_name
  	active_incident_report.present? ? name : nil
  end

  def loanee_name
  	active_loan.present? ? active_loan.user.name : nil
  end

  def loan_id
  	active_loan.present? ? active_loan.id : nil
  end


	# def is_usable?
	# 	true if (self.incident_reports.count != 0) && self.incident_reports.last[:usable]
	# end

	# def one_active_incident_report
	# 	if self.active_incident_reports(:reload).count >= 1
 #      errors.add(:base, "Exceeded thing limit")
 #    end
 #  end
private

  def with_incident_report_and_usable?
    (incident_reports.count > 0) && incident_reports.last[:usable]
  end

end
