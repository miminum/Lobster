require 'rails_helper'

RSpec.describe "orders/index", type: :view do
  before(:each) do
    assign(:orders, [
      Order.create!(
        :buyer => nil,
        :shop => nil,
        :delivery => false,
        :total_price => 2.5,
        :charge_identifier => "Charge Identifier",
        :payment_success => false,
        :mark_as_done => false
      ),
      Order.create!(
        :buyer => nil,
        :shop => nil,
        :delivery => false,
        :total_price => 2.5,
        :charge_identifier => "Charge Identifier",
        :payment_success => false,
        :mark_as_done => false
      )
    ])
  end

  it "renders a list of orders" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => "Charge Identifier".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
