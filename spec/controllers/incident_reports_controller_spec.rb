require 'rails_helper'

RSpec.describe IncidentReportsController, type: :controller do

  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]

    sign_in create(:user) # Using factory girl as an example
  end

  describe "GET #index" do
    before do
      incident_report  = build_stubbed(:incident_report)
      device = build_stubbed(:device, incident_reports: [incident_report])

      allow(Device).to receive(:find).with(device.id.to_s) { device }

      get :index, params: { device_id: device.id }
    end

    it { should render_template(:index) }
  end

  describe "POST #create" do
    context 'when Incident Report is valid' do
      before do
        device = build_stubbed(:device)

        allow(Device).to receive(:find).with(device.id.to_s) { device }

        allow_any_instance_of(IncidentReport).to receive(:save) { true }

        post :create, params: { incident_report: attributes_for(:incident_report), device_id: device.id }
      end

      it { should redirect_to(device_incident_reports_url)}
    end

    context 'when loan is invalid' do
       before do
        device = build_stubbed(:device)

        allow(Device).to receive(:find).with(device.id.to_s) { device }

        allow_any_instance_of(IncidentReport).to receive(:save) { false }

        post :create, params: { incident_report: attributes_for(:incident_report), device_id: device.id }
      end

      it { should render_template(:new) }
    end
  end



end
