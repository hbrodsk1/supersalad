require 'spec_helper'

describe Vote do
  it "has a valid factory" do
    expect(FactoryGirl.create(:vote)).to be_valid
  end
end