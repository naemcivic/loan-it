# == Schema Information
#
# Table name: loans
#
#  id          :integer          not null, primary key
#  description :text
#  signature   :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  device_id   :integer
#  user_id     :integer
#  active      :boolean          default(FALSE)
#

require 'test_helper'

class LoanTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
