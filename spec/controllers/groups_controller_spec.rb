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

end
