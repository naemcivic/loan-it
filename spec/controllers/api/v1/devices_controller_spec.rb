require 'rails_helper'

RSpec.describe Api::V1::DevicesController, type: :controller do
	before(:each) { request.headers['Accept'] = "application/vnd.loan-it.v1" }

  context "when is successfully created" do
    before(:each) do
      @device_attributes = FactoryGirl.attributes_for :device
      post :create, { device: @device_attributes }, format: :json
    end

    it "renders the json representation for the device record just created" do
      device_response = JSON.parse(response.body, symbolize_names: true)
      expect(device_response[:name]).to eql @device_attributes[:name]
    end

    it { should respond_with 201 }
  end

  context "when is not created" do
    before(:each) do
      #notice I'm not including the email
      @invalid_device_attributes = { group_id: 3}
      post :create, { device: @invalid_device_attributes }, format: :json
    end

    it "renders an errors json" do
      device_response = JSON.parse(response.body, symbolize_names: true)
      expect(device_response).to have_key(:errors)
    end

    it "renders the json errors on why the device could not be created" do
      device_response = JSON.parse(response.body, symbolize_names: true)
      expect(device_response[:errors][:name]).to include "can't be blank"
    end

    it { should respond_with 422 }
  end
end