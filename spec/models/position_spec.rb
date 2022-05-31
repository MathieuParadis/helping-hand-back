require 'rails_helper'

RSpec.describe Position, type: :model do


  before (:all) do
    @user = FactoryBot.create(:user)
    @position = FactoryBot.build(:position, user: @user)
  end

  after (:all) do
    Position.destroy_all
  end

  it "is valid with valid attributes" do
    expect(@position).to be_valid
  end

  it "is not valid without user" do
    position = FactoryBot.build(:position, user: nil)
    expect(position).to_not be_valid
  end

  it "is not valid without latitude" do
    position = FactoryBot.build(:position, lat: nil)
    expect(position).to_not be_valid
  end

  it "is not valid with invalid values of latitude" do
    position = FactoryBot.build(:position, lat: -91)
    expect(position).to_not be_valid
  end

  it "is not valid with invalid values of latitude" do
    position = FactoryBot.build(:position, lat: 91)
    expect(position).to_not be_valid
  end

  it "is not valid without longitude" do
    position = FactoryBot.build(:position, lng: nil)
    expect(position).to_not be_valid
  end

  it "is not valid with invalid values of longitude" do
    position = FactoryBot.build(:position, lng: -181)
    expect(position).to_not be_valid
  end

  it "is not valid with invalid values of longitude" do
    position = FactoryBot.build(:position, lng: 181)
    expect(position).to_not be_valid
  end

end