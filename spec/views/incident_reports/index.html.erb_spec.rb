require 'rails_helper'

RSpec.describe "incident_reports/index", type: :view do
  before(:each) do
    assign(:incident_reports, [
      IncidentReport.create!(
        :description => "MyText",
        :useable => false
      ),
      IncidentReport.create!(
        :description => "MyText",
        :useable => false
      )
    ])
  end

  it "renders a list of incident_reports" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
