# == Schema Information
#
# Table name: incident_reports
#
#  id          :integer          not null, primary key
#  description :text
#  usable     :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  device_id   :integer
#

require 'rails_helper'

RSpec.describe IncidentReport, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
