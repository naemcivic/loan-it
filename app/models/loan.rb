class Loan < ApplicationRecord
	validates_presence_of :description, :signature
	has_many :devices

	def create_loan(device)
      device = device_loaned
		
	end
end
