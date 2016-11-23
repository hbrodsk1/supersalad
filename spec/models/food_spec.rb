require 'spec_helper'

describe Food do
  it "has a valid factory" do
    expect(FactoryGirl.create(:food)).to be_valid
  end

  it "is invalid without a kind" do
  	expect(FactoryGirl.build(:food, kind: nil)).to be_invalid
  end

  it "is invalid without a title" do
  	expect(FactoryGirl.build(:food, title: nil)).to be_invalid
  end

  it "is invalid without an image" do
  	expect(FactoryGirl.build(:food, image: nil)).to be_invalid
  end
end