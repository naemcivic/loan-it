require 'rails_helper'

RSpec.describe "qr_codes/new", type: :view do
  before(:each) do
    assign(:qr_code, QrCode.new())
  end

  it "renders new qr_code form" do
    render

    assert_select "form[action=?][method=?]", qr_codes_path, "post" do
    end
  end
end
