class Loan < ApplicationRecord
	validates_presence_of :description, :signature
	has_many :devices
end
