require 'rails_helper'

RSpec.describe "group_controllers/show", type: :view do
  before(:each) do
    @group_controller = assign(:group_controller, GroupController.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
