require 'rails_helper'

RSpec.describe "orders/edit", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
      :buyer => nil,
      :shop => nil,
      :delivery => false,
      :total_price => 1.5,
      :charge_identifier => "MyString",
      :payment_success => false,
      :mark_as_done => false
    ))
  end

  it "renders the edit order form" do
    render

    assert_select "form[action=?][method=?]", order_path(@order), "post" do

      assert_select "input[name=?]", "order[buyer_id]"

      assert_select "input[name=?]", "order[shop_id]"

      assert_select "input[name=?]", "order[delivery]"

      assert_select "input[name=?]", "order[total_price]"

      assert_select "input[name=?]", "order[charge_identifier]"

      assert_select "input[name=?]", "order[payment_success]"

      assert_select "input[name=?]", "order[mark_as_done]"
    end
  end
end
