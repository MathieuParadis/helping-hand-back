require 'rails_helper'

RSpec.describe 'messages', type: :request do
  describe 'POST /create' do
    
    context 'with valid parameters' do
      before do
        @user1 = FactoryBot.create(:user)
        @user2 = FactoryBot.create(:user)
        @request = FactoryBot.create(:request, user: @user1)
        @chat = FactoryBot.create(:chat, request: @request, requester: @user1, volunteer: @user2)

        post '/signin', 
          params: { 
                    email: @user1.email,
                    password: @user1.password
                  }

        token = json['token']

        post '/messages', 
          headers: { 'Authorization' => "Bearer #{token}" },
          params: { 
            content: "message",
            chat_id: @chat.id,
            user_id: @user1.id
          }    
      end

      it 'returns success code 201' do
        expect(response.status).to eq(201)
      end

      it 'returns a created status 201' do
        expect(response).to have_http_status(:created)
      end
    end
    

    context 'with invalid parameters: unauthorized user' do
      before do
        @user1 = FactoryBot.create(:user)
        @user2 = FactoryBot.create(:user)
        @user3 = FactoryBot.create(:user)
        @request = FactoryBot.create(:request, user: @user1)
        @chat = FactoryBot.create(:chat, request: @request, requester: @user1, volunteer: @user2)

        post '/signin', 
          params: { 
                    email: @user3.email,
                    password: @user3.password
                  }

        token = json['token']

        post '/messages', 
          headers: { 'Authorization' => "Bearer #{token}" },
          params: { 
            content: "message",
            chat_id: @chat.id,
            user_id: @user3.id
          }    
      end

      it 'returns an error message' do
        error = json['error']
        expect(error).to eq("You do not have the right to perform this action")
      end

      it 'returns an error code 422' do
        expect(response.status).to eq(422)
      end

      it 'returns a unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

  end
end
