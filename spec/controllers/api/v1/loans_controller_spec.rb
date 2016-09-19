require 'rails_helper'

RSpec.describe Api::V1::LoansController, type: :controller do
	before(:each) { request.headers['Accept'] = "application/vnd.loan-it.v1" }

 context "when is successfully created" do
    before(:each) do
      @loan_attributes = FactoryGirl.attributes_for :loan
      post :create, { loan: @loan_attributes }, format: :json
    end

    it "renders the json representation for the loan record just created" do
      loan_response = JSON.parse(response.body, symbolize_names: true)
      expect(loan_response[:name]).to eql @loan_attributes[:name]
    end

    it { should respond_with 201 }
  end
end