require "rails_helper"

RSpec.describe IncidentReportsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/incident_reports").to route_to("incident_reports#index")
    end

    it "routes to #new" do
      expect(:get => "/incident_reports/new").to route_to("incident_reports#new")
    end

    it "routes to #show" do
      expect(:get => "/incident_reports/1").to route_to("incident_reports#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/incident_reports/1/edit").to route_to("incident_reports#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/incident_reports").to route_to("incident_reports#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/incident_reports/1").to route_to("incident_reports#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/incident_reports/1").to route_to("incident_reports#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/incident_reports/1").to route_to("incident_reports#destroy", :id => "1")
    end

  end
end
