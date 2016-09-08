require 'rails_helper'

RSpec.describe "qr_codes/show", type: :view do
  before(:each) do
    @qr_code = assign(:qr_code, QrCode.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
