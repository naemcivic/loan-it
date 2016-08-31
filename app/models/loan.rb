class Loan < ApplicationRecord
  validates_presence_of :description, :signature
  belongs_to :device
  belongs_to :user

  before_create :set_active_loan

  def self.active
    where(active: true)
  end

  def set_active_loan
    self.active = true
  end


end