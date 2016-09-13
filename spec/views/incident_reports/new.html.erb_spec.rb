require 'rails_helper'

RSpec.describe "incident_reports/new", type: :view do
  before(:each) do
    assign(:incident_report, IncidentReport.new(
      :description => "MyText",
      :usable => false
    ))
  end

  it "renders new incident_report form" do
    render

    assert_select "form[action=?][method=?]", incident_reports_path, "post" do

      assert_select "textarea#incident_report_description[name=?]", "incident_report[description]"

      assert_select "input#incident_report_usable[name=?]", "incident_report[usable]"
    end
  end
end
