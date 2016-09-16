require 'rails_helper'

RSpec.describe Api::V1::LoansController, type: :controller do
	before(:each) { request.headers['Accept'] = "application/vnd.loan-it.v1" }
  describe "DELETE #destroy" do
    before(:each) do
      @loan = FactoryGirl.create :loan
      delete :destroy, { id: @loan.id }, format: :json
    end

    it { should change{active.to}.(false)}
  end

end