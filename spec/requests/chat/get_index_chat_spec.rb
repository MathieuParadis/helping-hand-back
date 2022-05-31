require 'rails_helper'

RSpec.describe 'chats', type: :request do
  describe 'GET /index' do
    before do
      @position = FactoryBot.build(:position, lat: 50, lng: 50)
      @user1 = FactoryBot.create(:user, position: @position) 
      @user2 = FactoryBot.create(:user, position: @position) 
      @user3 = FactoryBot.create(:user, position: @position) 
      @user4 = FactoryBot.create(:user, position: @position) 
      @request1 = FactoryBot.create(:request, lat: 50, lng: 50, user: @user1)
      @request2 = FactoryBot.create(:request, lat: 50, lng: 50, user: @user2)
      @request3 = FactoryBot.create(:request, lat: 50, lng: 50, user: @user3)
      @request4 = FactoryBot.create(:request, lat: 50, lng: 50, user: @user4)

      for i in 1..10 do
        FactoryBot.create(:chat, request: @request1, requester: @user1, volunteer: @user2)
        FactoryBot.create(:chat, request: @request2, requester: @user2, volunteer: @user1)
        FactoryBot.create(:chat, request: @request3, requester: @user3, volunteer: @user4)
        FactoryBot.create(:chat, request: @request4, requester: @user4, volunteer: @user3)
      end

        post '/signin', 
          params: { 
                    email: @user1.email,
                    password: @user1.password
                  }

        token = json['token']

        get '/chats', 
          headers: { 'Authorization' => "Bearer #{token}" }
      end

      it 'returns all chats where user is either volunteer or requester' do
        expect(json.size).to eq(20)
      end

      it 'returns success code 200' do
        expect(response.status).to eq(200)
      end

      it 'returns a ok status 200' do
        expect(response).to have_http_status(:ok)
      end
    end

  end