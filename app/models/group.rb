class Group < ApplicationRecord
	has_many :devices, dependent: :destroy
	has_many :users
end
