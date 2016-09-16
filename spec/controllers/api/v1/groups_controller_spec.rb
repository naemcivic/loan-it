require 'rails_helper'

RSpec.describe Api::V1::GroupsController, type: :controller do
  describe "GET 'index' " do
    it "returns a successful 200 response" do
      get :index, format: :json
      expect(response).to be_success
    end

    it "returns all the groups" do
      FactoryGirl.create_list(:group, 7)
      get :index, format: :json
      parsed_response = JSON.parse(response.body)
      group_hash = Hash[parsed_response.map {|key, value| [key, value]}]
      expect(group_hash.length).to eq(7)
    end
  end
end