require 'rails_helper'

RSpec.describe Profile, type: :model do
  it "should be reject phone numbers that don't contain digits" do
    profile = Profile.new(first_name: 'Pickle', last_name: 'Rick', street_address: '36 Lakewood Bvd', suburb:'Cairnlea', state:'VIC', phone_number: 'abc')
    profile1 = Profile.new(first_name: 'Pickle', last_name: 'Rick', street_address: '36 Lakewood Bvd', suburb:'Cairnlea', state:'VIC', phone_number: '0421119005')
    expect(profile1).to be_valid
    expect(profile).to be_invalid
  end
end
