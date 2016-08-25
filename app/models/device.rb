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
	belongs_to :user
	belongs_to :group
end
