require 'rails_helper'

RSpec.describe "GroupControllers", type: :request do
  describe "GET /group_controllers" do
    it "works! (now write some real specs)" do
      get group_controllers_path
      expect(response).to have_http_status(200)
    end
  end
end
