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

      incident_report = build_stubbed(:incident_report)

      device = build_stubbed(:device, incident_reports: [incident_report])

      allow(Device).to receive(:find).with(device.id.to_s) { device }

      allow(IncidentReport).to receive(:find).with(incident_report.id.to_s) {incident_report}

      allow(incident_report).to receive(:update).with({useable: true}) { }

      delete :destroy, params: { device_id: device.id, id: incident_report.id }


    end
    it { should redirect_to(device_incident_reports_url)}
  end

  describe 'Patch #update' do
    context 'when incident_report edit is valid' do
      before do
        incident_report = build_stubbed(:incident_report)

        device = build_stubbed(:device, incident_reports: [incident_report])

        allow(Device).to receive(:find).with(device.id.to_s) { device }

        allow(IncidentReport).to receive(:find).with(incident_report.id.to_s) {incident_report}

        allow_any_instance_of(IncidentReport).to receive(:update) { true }

        patch :update, params: { device_id: device.id, id: incident_report.id, incident_report: attributes_for(:incident_report) }
      end

      it { should redirect_to(device_incident_reports_url)}
    end


    context 'when incident_report edit is invalid' do
      before do

        incident_report = build_stubbed(:incident_report)

        device = build_stubbed(:device, incident_reports: [incident_report])

        allow(Device).to receive(:find).with(device.id.to_s) { device }

        allow(IncidentReport).to receive(:find).with(incident_report.id.to_s) {incident_report}

        allow_any_instance_of(IncidentReport).to receive(:update) { false }

        patch :update, params: { device_id: device.id, id: incident_report.id, incident_report: attributes_for(:incident_report) }
      end

      it { should render_template(:edit)}

    end
  end

  describe "GET #edit" do
    before do

      incident_report = build_stubbed(:incident_report)

      device = build_stubbed(:device, incident_reports: [incident_report])

      allow(Device).to receive(:find).with(device.id.to_s) { device }

      allow(IncidentReport).to receive(:find).with(incident_report.id.to_s) {incident_report}

      get :edit, params: { device_id: device.id, id: incident_report.id }
    end

    it { should render_template(:edit) }
  end



end
