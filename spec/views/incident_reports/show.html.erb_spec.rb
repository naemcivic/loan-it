require 'rails_helper'

RSpec.describe "incident_reports/show", type: :view do
  before(:each) do
    @incident_report = assign(:incident_report, IncidentReport.create!(
      :description => "MyText",
      :usable => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
  end
end
