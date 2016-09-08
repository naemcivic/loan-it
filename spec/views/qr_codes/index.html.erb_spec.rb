require 'rails_helper'

RSpec.describe "qr_codes/index", type: :view do
  before(:each) do
    assign(:qr_codes, [
      QrCode.create!(),
      QrCode.create!()
    ])
  end

  it "renders a list of qr_codes" do
    render
  end
end
