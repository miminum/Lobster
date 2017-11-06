require 'rails_helper'

RSpec.describe "orders/show", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
      :buyer => nil,
      :shop => nil,
      :delivery => false,
      :total_price => 2.5,
      :charge_identifier => "Charge Identifier",
      :payment_success => false,
      :mark_as_done => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/Charge Identifier/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
  end
end
