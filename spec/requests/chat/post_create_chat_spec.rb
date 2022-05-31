require 'rails_helper'

RSpec.describe 'chats', type: :request do
  describe 'POST /create' do
    before do
      @position = FactoryBot.build(:position, lat: 50, lng: 50)
      @user1 = FactoryBot.create(:user, position: @position) 
      @user2 = FactoryBot.create(:user, position: @position) 
      @request1 = FactoryBot.create(:request, lat: 50, lng: 50, user: @user1)

      post '/signin', 
        params: { 
                  email: @user1.email,
                  password: @user1.password
                }

      token = json['token']

      post '/chats', 
        headers: { 'Authorization' => "Bearer #{token}" },
        params: { 
          request_id: @request1.id,
          requester_id: @user2.id,
          volunteer_id: @user1.id
        }    
    end

    it 'returns success code 201' do
      expect(response.status).to eq(201)
    end

    it 'returns a created status 201' do
      expect(response).to have_http_status(:created)
    end
  end
end
