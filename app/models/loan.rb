class Loan < ApplicationRecord
	validates_presence_of :description, :signature
	belongs_to :device
	belongs_to :user

end
