require 'rails_helper'

RSpec.describe Chat, type: :model do

  before (:all) do
    @requester = FactoryBot.create(:user)
    @volunteer = FactoryBot.create(:user)
    @request = FactoryBot.build(:request, user: @requester)
    @chat = FactoryBot.build(:chat, request: @request, requester: @requester, volunteer: @volunteer)
  end

  after (:all) do
    Chat.destroy_all
  end

  it "is valid with valid attributes" do
    expect(@chat).to be_valid
  end

  it "is not valid without request" do
    chat = FactoryBot.build(:chat, request: nil)
    expect(chat).to_not be_valid
  end

  it "is not valid without requester" do
    chat = FactoryBot.build(:chat, requester: nil)
    expect(chat).to_not be_valid
  end
  
  it "is not valid without volunteer" do
    chat = FactoryBot.build(:chat, volunteer: nil)
    expect(chat).to_not be_valid
  end
end