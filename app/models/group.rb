# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  name       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Group < ApplicationRecord
	has_many :devices, dependent: :destroy
	has_many :users

	def name_of_group
		"#{group.name}"
	end
end
