require 'rails_helper'

RSpec.describe "qr_codes/edit", type: :view do
  before(:each) do
    @qr_code = assign(:qr_code, QrCode.create!())
  end

  it "renders the edit qr_code form" do
    render

    assert_select "form[action=?][method=?]", qr_code_path(@qr_code), "post" do
    end
  end
end
