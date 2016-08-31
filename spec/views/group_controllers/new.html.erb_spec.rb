require 'rails_helper'

RSpec.describe "group_controllers/new", type: :view do
  before(:each) do
    assign(:group_controller, GroupController.new())
  end

  it "renders new group_controller form" do
    render

    assert_select "form[action=?][method=?]", group_controllers_path, "post" do
    end
  end
end
