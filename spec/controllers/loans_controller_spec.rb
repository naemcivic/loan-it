require 'rails_helper'

RSpec.describe LoansController, type: :controller do
	before do
		@request.env["devise.mapping"] = Devise.mappings[:user]

		sign_in create(:user) # Using factory girl as an example
	end

	describe "GET #index" do
		before do
			loan = build_stubbed(:loan)
			device = build_stubbed(:device, loans: [loan])

			allow(Device).to receive(:find).with(device.id.to_s) { device }

			get :index, params: { device_id: device.id }
		end

		it { should render_template(:index) }
	end

	describe "POST #create" do
		context 'when loan is valid' do
			before do
				device = build_stubbed(:device)

				allow(Device).to receive(:find).with(device.id.to_s) { device }

				allow_any_instance_of(Loan).to receive(:save) { true }

				post :create, params: { loan: attributes_for(:loan), device_id: device.id }
			end

			it { should redirect_to(device_loans_url)}
		end

		context 'when loan is invalid' do
			before do
				device = build_stubbed(:device)

				allow(Device).to receive(:find).with(device.id.to_s) { device }

				allow_any_instance_of(Loan).to receive(:save) { false }

	      post :create, params: { loan: attributes_for(:loan), device_id: device.id }
	    end

	    it { should render_template(:new) }
		end
	end

	describe 'GET #new' do
		before do
			device = build_stubbed(:device)

			allow(Device).to receive(:find).with(device.id.to_s) { device }

			get :new, params: { device_id: device.id }
		end

	  it { should render_template(:new) }

	end

	describe 'DELETE #destoy' do
		before do

			loan = build_stubbed(:loan)

			device = build_stubbed(:device, loans: [loan])

			allow(Device).to receive(:find).with(device.id.to_s) { device }

			allow(Loan).to receive(:find).with(loan.id.to_s) {loan}

			allow(loan).to receive(:update).with({active: false}) { }

			delete :destroy, params: { device_id: device.id, id: loan.id }


		end
		it { should redirect_to(device_loans_url)}
	end

	describe 'Patch #update' do
		context 'when loan edit is valid' do
			before do

				loan = build_stubbed(:loan)

			  device = build_stubbed(:device, loans: [loan])

				allow(Device).to receive(:find).with(device.id.to_s) { device }

				allow(Loan).to receive(:find).with(loan.id.to_s) {loan}

				allow_any_instance_of(Loan).to receive(:update) { true }

				patch :update, params: { device_id: device.id, id: loan.id, loan: attributes_for(:loan) }
	    end

			it { should redirect_to(device_loans_url)}
		end


    context 'when loan edit is invalid' do
			before do

				loan = build_stubbed(:loan)

			  device = build_stubbed(:device, loans: [loan])

				allow(Device).to receive(:find).with(device.id.to_s) { device }

				allow(Loan).to receive(:find).with(loan.id.to_s) {loan}

				allow_any_instance_of(Loan).to receive(:update) { false }

				patch :update, params: { device_id: device.id, id: loan.id, loan: attributes_for(:loan) }
			end

			it { should render_template(:edit)}

		end
  end

  describe "GET #edit" do
		before do

			loan = build_stubbed(:loan)

			device = build_stubbed(:device, loans: [loan])

			allow(Device).to receive(:find).with(device.id.to_s) { device }

			allow(Loan).to receive(:find).with(loan.id.to_s) {loan}

			get :edit, params: { device_id: device.id, id: loan.id }
		end

		it { should render_template(:edit) }
	end
end