class Group < ApplicationRecord
	has_many :devices, dependent: :destroy
	has_many :users

	def name_of_group
		"#{group.name}"
	end
end
