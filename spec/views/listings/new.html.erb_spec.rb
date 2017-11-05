require 'rails_helper'

RSpec.describe "listings/new", type: :view do
  before(:each) do
    assign(:listing, Listing.new(
      :item => nil,
      :quantity => 1,
      :seller_profile => nil
    ))
  end

  it "renders new listing form" do
    render

    assert_select "form[action=?][method=?]", listings_path, "post" do

      assert_select "input[name=?]", "listing[item_id]"

      assert_select "input[name=?]", "listing[quantity]"

      assert_select "input[name=?]", "listing[seller_profile_id]"
    end
  end
end
