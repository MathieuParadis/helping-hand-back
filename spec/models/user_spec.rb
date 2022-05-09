require 'rails_helper'

RSpec.describe User, type: :model do

  before (:all) do
    @user = FactoryBot.build(:user)
  end

  after (:all) do
    User.destroy_all
  end

  it "is valid with valid attributes" do
    expect(@user).to be_valid
  end

  it "is not valid without first name" do
    user = FactoryBot.build(:user, first_name: nil)
    expect(user).to_not be_valid
  end

  it "is not valid without last name" do
    user = FactoryBot.build(:user, last_name: nil)
    expect(user).to_not be_valid
  end

  it "is not valid without email" do
    user = FactoryBot.build(:user, email: nil)
    expect(user).to_not be_valid
  end

  it "is not valid with exisiting email" do
    user1 = FactoryBot.create(:user, email: "user@gmail.com")
    user2 = FactoryBot.build(:user, email: "user@gmail.com")
    expect(user2).to_not be_valid
  end

  it "is not valid without password" do
    user = FactoryBot.build(:user, password: nil)
    expect(user).to_not be_valid
  end

  it "is not valid with password less than 6 characters" do
    user = FactoryBot.build(:user, password: "toto")
    expect(user).to_not be_valid
  end

  it "is not valid with different passwords" do
    user = FactoryBot.build(:user, password: "tototo", password_confirmation: "momomo")
    expect(user).to_not be_valid
  end

  it "is not valid without id_card_url" do # simulates the case no file has been saved in active storage
    user = FactoryBot.build(:user, id_card_url: "")
    expect(user).to_not be_valid
  end
end