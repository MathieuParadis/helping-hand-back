require 'rails_helper'

RSpec.describe Message, type: :model do

  before (:all) do
    @requester = FactoryBot.create(:user)
    @volunteer = FactoryBot.create(:user)
    @request = FactoryBot.build(:request, user: @requester)
    @chat = FactoryBot.build(:chat, request: @request, requester: @requester, volunteer: @volunteer)
    @message = FactoryBot.build(:message, chat: @chat, user: @volunteer)
  end

  after (:all) do
    Message.destroy_all
  end

  it "is valid with valid attributes" do
    expect(@message).to be_valid
  end

  it "is not valid without chat" do
    message = FactoryBot.build(:message, chat: nil)
    expect(message).to_not be_valid
  end

  it "is not valid without user" do
    message = FactoryBot.build(:message, user: nil)
    expect(message).to_not be_valid
  end
end