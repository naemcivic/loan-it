require 'rails_helper'

RSpec.describe "group_controllers/index", type: :view do
  before(:each) do
    assign(:group_controllers, [
      GroupController.create!(),
      GroupController.create!()
    ])
  end

  it "renders a list of group_controllers" do
    render
  end
end
