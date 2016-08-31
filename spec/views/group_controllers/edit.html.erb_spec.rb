require 'rails_helper'

RSpec.describe "group_controllers/edit", type: :view do
  before(:each) do
    @group_controller = assign(:group_controller, GroupController.create!())
  end

  it "renders the edit group_controller form" do
    render

    assert_select "form[action=?][method=?]", group_controller_path(@group_controller), "post" do
    end
  end
end
