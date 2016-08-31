require 'rails_helper'

RSpec.describe DevicesController, type: :controller do
	before do
		@request.env["devise.mapping"] = Devise.mappings[:user]

		sign_in create(:user) # Using factory girl as an example
	end

	describe "GET #index" do
		before do
			device = build_stubbed(:device)

			allow(Device).to receive(:find).with(device.id.to_s) { device }

			get :index
		end

		it { should render_template(:index) }
	end

	describe "POST #create" do
		context 'when device is valid' do
			before do
				device = build_stubbed(:device)

				allow(Device).to receive(:find).with(device.id.to_s) { device }

				allow_any_instance_of(Device).to receive(:save) { true }

				post :create, params: { device: attributes_for(:device) }
			end

			it { should redirect_to(@device)}
		end

		context 'when device is invalid' do
			before do
				device = build_stubbed(:device)

				allow(Device).to receive(:find).with(device.id.to_s) { device }

				allow_any_instance_of(Device).to receive(:save) { false }

	      post :create, params: { device: attributes_for(:device)}
	    end

	    it { should render_template(:new) }
		end
	end

	describe 'GET #new' do
		before do
			device = build_stubbed(:device)

			allow(Device).to receive(:find).with(device.id.to_s) { device }

			get :new
		end

	  it { should render_template(:new) }

	end

	describe 'DELETE #destoy' do

		before do

			device = build_stubbed(:device)


			allow(Device).to receive(:find).with(device.id.to_s) { device }

			allow(device).to receive(:destroy) { }


			delete :destroy, params: { id: device.id }


		end

		it { should redirect_to(devices_url) }
  end

	describe 'Patch #update' do
		context 'when device update is valid' do
			before do
				device = build_stubbed(:device)

				allow(Device).to receive(:find).with(device.id.to_s) { device }

				allow_any_instance_of(Device).to receive(:update) { true }

				patch :update, params: { id: device.id, device: attributes_for(:device) }
	    end

			it { should redirect_to(@device)}

		end


    context 'when device update is invalid' do
			before do
				device = build_stubbed(:device)

				allow(Device).to receive(:find).with(device.id.to_s) { device }

				allow_any_instance_of(Device).to receive(:update) { false }

				patch :update, params: { id: device.id, device: attributes_for(:device) }
			end

			it { should render_template(:edit)}

		end
  end

  describe "GET #edit" do
		before do
			device = build_stubbed(:device)

			allow(Device).to receive(:find).with(device.id.to_s) { device }

			get :edit, params: { id: device.id }
		end

		it { should render_template(:edit) }
	end

end


