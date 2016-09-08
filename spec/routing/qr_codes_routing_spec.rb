require "rails_helper"

RSpec.describe QrCodesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/qr_codes").to route_to("qr_codes#index")
    end

    it "routes to #new" do
      expect(:get => "/qr_codes/new").to route_to("qr_codes#new")
    end

    it "routes to #show" do
      expect(:get => "/qr_codes/1").to route_to("qr_codes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/qr_codes/1/edit").to route_to("qr_codes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/qr_codes").to route_to("qr_codes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/qr_codes/1").to route_to("qr_codes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/qr_codes/1").to route_to("qr_codes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/qr_codes/1").to route_to("qr_codes#destroy", :id => "1")
    end

  end
end
