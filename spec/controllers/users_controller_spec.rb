require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]

    sign_in create(:user) # Using factory girl as an example
  end

  describe "GET #index" do
    before do
      user = build_stubbed(:user)

      allow(User).to receive(:find).with(user.id.to_s) { user }

      get :index
    end

    it { should render_template(:index) }
  end

  describe "POST #create" do
    context 'when user is valid' do
      before do
        user = build_stubbed(:user)

        allow(User).to receive(:find).with(user.id.to_s) { user }

        allow_any_instance_of(User).to receive(:save) { true }

        post :create, params: { user: attributes_for(:user) }
      end

      it { should redirect_to(@user)}
    end

    context 'when user is invalid' do
      before do
        user = build_stubbed(:user)

        allow(User).to receive(:find).with(user.id.to_s) { user }

        allow_any_instance_of(User).to receive(:save) { false }

        post :create, params: { user: attributes_for(:user) }
      end

      it { should render_template(:new) }
    end
  end

  describe 'GET #new' do
    before do
      user = build_stubbed(:user)

      allow(User).to receive(:find).with(user.id.to_s) { user }

      get :new
    end

    it { should render_template(:new) }

  end

  describe 'DELETE #destoy' do

    before do

      user = build_stubbed(:user)

      allow(User).to receive(:find).with(user.id.to_s) { user }

      allow(user).to receive(:destroy) { }


      delete :destroy, params: { id: user.id }


    end

    it { should redirect_to(users_url) }
  end

  describe 'Patch #update' do
    context 'when user update is valid' do
      before do
        user = build_stubbed(:user)

        allow(User).to receive(:find).with(user.id.to_s) { user }

        allow_any_instance_of(User).to receive(:update) { true }

        patch :update, params: { id: user.id, user: attributes_for(:user) }
      end

      it { should redirect_to(@user)}

    end


    context 'when user update is invalid' do
      before do
        user = build_stubbed(:user)

        allow(User).to receive(:find).with(user.id.to_s) { user }

        allow_any_instance_of(User).to receive(:update) { false }

        patch :update, params: { id: user.id, user: attributes_for(:user) }
      end

      it { should render_template(:edit)}

    end
  end

  describe "GET #edit" do
    before do
      user = build_stubbed(:user)

      allow(User).to receive(:find).with(user.id.to_s) { user }

      get :edit, params: { id: user.id }
    end

    it { should render_template(:edit) }
  end
end
