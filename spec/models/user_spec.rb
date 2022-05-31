require 'rails_helper'

RSpec.describe User, type: :model do

  before (:all) do
    @position = FactoryBot.build(:position)
    @user = FactoryBot.build(:user, position: @position)
  end

  after (:all) do
    User.destroy_all
  end

  it "is valid with valid attributes" do
    expect(@user).to be_valid
  end

  it "is valid without position" do
    user = FactoryBot.build(:user, position: nil)
    expect(user).to be_valid
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

  it "is not valid without id_card" do # simulated by setting id_card_url to ''
    user = FactoryBot.build(:user, id_card_url: '' )
    expect(user).to_not be_valid
  end

  it "is not valid with id_card with the wrong type / extension, only png | jpg | pdf allowed" do
    user = FactoryBot.build(:user, id_card: Rack::Test::UploadedFile.new('spec/files/IDcard.doc', 'application/doc'))
    expect(user).to_not be_valid
  end

  it "is valid with png file" do
    user = FactoryBot.build(:user, id_card: Rack::Test::UploadedFile.new('spec/files/IDcard.png', 'image/png'))
    expect(user).to be_valid
  end

  it "is valid with jpg file" do
    user = FactoryBot.build(:user, id_card: Rack::Test::UploadedFile.new('spec/files/IDcard.jpg', 'image/jpg'))
    expect(user).to be_valid
  end

  it "is valid with jpeg file" do
    user = FactoryBot.build(:user, id_card: Rack::Test::UploadedFile.new('spec/files/IDcard.jpeg', 'image/jpeg'))
    expect(user).to be_valid
  end

  it "is valid with pdf file" do
    user = FactoryBot.build(:user, id_card: Rack::Test::UploadedFile.new('spec/files/IDcard.pdf', 'application/pdf'))
    expect(user).to be_valid
  end

end