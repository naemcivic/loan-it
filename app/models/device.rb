# == Schema Information
#
# Table name: devices
#
#  id         :integer          not null, primary key
#  name       :string
#  id_number  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  group_name :string
#  group_id   :integer
#  assigned   :boolean
#

class Device < ApplicationRecord
	belongs_to :group
	has_many :loans, ->() { order(created_at: :desc)}

	has_one :active_loan, ->() { where(active: true) }, class_name: Loan

	has_many :users, through: :loans
end
