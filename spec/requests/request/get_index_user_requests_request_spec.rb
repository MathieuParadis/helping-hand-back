require 'rails_helper'

RSpec.describe 'Requests', type: :request do
  describe 'GET /index_user_requests' do
    before do
      @position = FactoryBot.build(:position, lat: 50, lng: 50)
      @user1 = FactoryBot.create(:user, position: @position) 
      @user2 = FactoryBot.create(:user, position: @position) 

      for i in 1..10 do
        FactoryBot.create(:request, lat: 50, lng: 50, user: @user1)
        FactoryBot.create(:request, lat: 50, lng: 50, user: @user2)
      end

        post '/signin', 
          params: { 
                    email: @user1.email,
                    password: @user1.password
                  }

        token = json['token']

        get '/user-requests', 
          headers: { 'Authorization' => "Bearer #{token}" }
      end

      it 'returns only the requests that belong to the user' do
        expect(json.size).to eq(10)
      end

      it 'returns success code 200' do
        expect(response.status).to eq(200)
      end

      it 'returns a ok status 200' do
        expect(response).to have_http_status(:ok)
      end
    end

  end