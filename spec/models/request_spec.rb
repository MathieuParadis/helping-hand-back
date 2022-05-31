require 'rails_helper'

RSpec.describe Request, type: :model do

  before (:all) do
    @user = FactoryBot.create(:user)
    @request = FactoryBot.build(:request, user: @user)
  end

  after (:all) do
    Request.destroy_all
  end

  it "is valid with valid attributes" do
    expect(@request).to be_valid
  end

  it "is not valid without title" do
    request = FactoryBot.build(:request, user: @user, title: nil)
    expect(request).to_not be_valid
  end

  it "is not valid without title over 50 characters" do #test with 51 characters
    request = FactoryBot.build(:request, user: @user, title: "The hot potatoes head and the story of the lion fox") 
    expect(request).to_not be_valid
  end

  it "is not valid without request_type" do
    request = FactoryBot.build(:request, user: @user, request_type: nil)
    expect(request).to_not be_valid
  end

  it "is not valid without location" do
    request = FactoryBot.build(:request, user: @user, location: nil)
    expect(request).to_not be_valid
  end

  it "is not valid without latitude" do
    request = FactoryBot.build(:request, user: @user, lat: nil)
    expect(request).to_not be_valid
  end

  it "is not valid without latitude below -90" do
    request = FactoryBot.build(:request, user: @user, lat: -91)
    expect(request).to_not be_valid
  end

  it "is not valid without latitude over 90" do
    request = FactoryBot.build(:request, user: @user, lat: 91)
    expect(request).to_not be_valid
  end

  it "is not valid without longitude" do
    request = FactoryBot.build(:request, user: @user, lng: nil)
    expect(request).to_not be_valid
  end

  it "is not valid without longitude below -180" do
    request = FactoryBot.build(:request, user: @user, lng: -181)
    expect(request).to_not be_valid
  end

  it "is not valid without longitude over 180" do
    request = FactoryBot.build(:request, user: @user, lng: 181)
    expect(request).to_not be_valid
  end

  it "is not valid without description" do
    request = FactoryBot.build(:request, user: @user, description: nil)
    expect(request).to_not be_valid
  end

  it "is not valid with description with more than 300 characters" do # test with 301 characters
    request = FactoryBot.build(:request, user: @user, description: "Super long sentence here and dots ..............??????????????????????????????????????????????????????????????????????????..........................................................................................................................................*&^%$#@*&^%$#*&^%$#)*(&^%$#@$%^&*)(*$&#%^")
    expect(request).to_not be_valid
  end

  it "is not valid without status" do
    request = FactoryBot.build(:request, user: @user, status: nil)
    expect(request).to_not be_valid
  end

  it "is not valid without count" do
    request = FactoryBot.build(:request, user: @user, count: nil)
    expect(request).to_not be_valid
  end

  it "is not valid without expiry_date" do
    request = FactoryBot.build(:request, user: @user, expiry_date: nil)
    expect(request).to_not be_valid
  end
end