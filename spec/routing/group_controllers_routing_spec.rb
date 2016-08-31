require "rails_helper"

RSpec.describe GroupControllersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/group_controllers").to route_to("group_controllers#index")
    end

    it "routes to #new" do
      expect(:get => "/group_controllers/new").to route_to("group_controllers#new")
    end

    it "routes to #show" do
      expect(:get => "/group_controllers/1").to route_to("group_controllers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/group_controllers/1/edit").to route_to("group_controllers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/group_controllers").to route_to("group_controllers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/group_controllers/1").to route_to("group_controllers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/group_controllers/1").to route_to("group_controllers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/group_controllers/1").to route_to("group_controllers#destroy", :id => "1")
    end

  end
end
