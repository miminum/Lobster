require 'rails_helper'

RSpec.describe "listings/edit", type: :view do
  before(:each) do
    @listing = assign(:listing, Listing.create!(
      :item => nil,
      :quantity => 1,
      :seller_profile => nil
    ))
  end

  it "renders the edit listing form" do
    render

    assert_select "form[action=?][method=?]", listing_path(@listing), "post" do

      assert_select "input[name=?]", "listing[item_id]"

      assert_select "input[name=?]", "listing[quantity]"

      assert_select "input[name=?]", "listing[seller_profile_id]"
    end
  end
end
