# == Schema Information
#
# Table name: loans
#
#  id         :integer          not null, primary key
#  signature  :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  device_id  :integer
#  user_id    :integer
#  active     :boolean          default(FALSE)
#

class Loan < ApplicationRecord
  validates_presence_of :signature
  belongs_to :device
  belongs_to :user

  before_create :set_active_loan

  def self.active
    where(active: true)
  end

  def set_active_loan
    self.active = true
  end

  def name
    try(:user).try(:name) || "No Name"
  end
end
