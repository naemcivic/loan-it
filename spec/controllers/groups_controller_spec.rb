require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]

    sign_in create(:user) # Using factory girl as an example
  end

  describe "GET #index" do
    before do
      group = build_stubbed(:group)

      allow(Group).to receive(:find).with(group.id.to_s) { group }

      get :index
    end

    it { should render_template(:index) }
  end

  describe "POST #create" do
    context 'when group is valid' do
      before do
        group = build_stubbed(:group)

        allow(Group).to receive(:find).with(group.id.to_s) { group }

        allow_any_instance_of(Group).to receive(:save) { true }

        post :create, params: { group: attributes_for(:group) }
      end

      it { should redirect_to(@group)}
    end

    context 'when group is invalid' do
      before do
        group = build_stubbed(:group)

        allow(Group).to receive(:find).with(group.id.to_s) { group }

        allow_any_instance_of(Group).to receive(:save) { false }

        post :create, params: { group: attributes_for(:group) }
      end

      it { should render_template(:new) }
    end
  end

  describe 'GET #new' do
    before do
      group = build_stubbed(:group)

      allow(Group).to receive(:find).with(group.id.to_s) { group }

      get :new
    end

    it { should render_template(:new) }

  end

  describe 'DELETE #destoy' do

    before do

      group = build_stubbed(:group)

      allow(Group).to receive(:find).with(group.id.to_s) { group }

      allow(group).to receive(:destroy) { }


      delete :destroy, params: { id: group.id }


    end

    it { should redirect_to(groups_url) }
  end

  describe 'Patch #update' do
    context 'when group update is valid' do
      before do
        group = build_stubbed(:group)

        allow(Group).to receive(:find).with(group.id.to_s) { group }

        allow_any_instance_of(Group).to receive(:update) { true }

        patch :update, params: { id: group.id, group: attributes_for(:group) }
      end

      it { should redirect_to(@group)}

    end


    context 'when group update is invalid' do
      before do
        group = build_stubbed(:group)

        allow(Group).to receive(:find).with(group.id.to_s) { group }

        allow_any_instance_of(Group).to receive(:update) { false }

        patch :update, params: { id: group.id, group: attributes_for(:group) }
      end

      it { should render_template(:edit)}

    end
  end

  describe "GET #edit" do
    before do
      group = build_stubbed(:group)

      allow(Group).to receive(:find).with(group.id.to_s) { group }

      get :edit, params: { id: group.id }
    end

    it { should render_template(:edit) }
  end
end
