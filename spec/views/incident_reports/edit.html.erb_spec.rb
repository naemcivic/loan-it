require 'rails_helper'

RSpec.describe "incident_reports/edit", type: :view do
  before(:each) do
    @incident_report = assign(:incident_report, IncidentReport.create!(
      :description => "MyText",
      :usable => false
    ))
  end

  it "renders the edit incident_report form" do
    render

    assert_select "form[action=?][method=?]", incident_report_path(@incident_report), "post" do

      assert_select "textarea#incident_report_description[name=?]", "incident_report[description]"

      assert_select "input#incident_report_usable[name=?]", "incident_report[usable]"
    end
  end
end
