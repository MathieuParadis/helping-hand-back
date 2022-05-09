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

  # it "is not valid without IDcard_url" do
  #   user = FactoryBot.build(:user, id_card_url: nil)
  #   expect(rider).to_not be_valid
  # end

  # it "is not valid without position" do
  #   rider = FactoryBot.build(:rider, position: nil)
  #   expect(rider).to_not be_valid
  # end

end