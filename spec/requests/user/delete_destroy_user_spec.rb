require 'rails_helper'

RSpec.describe 'User delete', type: :request do
  describe 'DELETE /destroy' do

    context 'with valid parameters' do
      let!(:user1) { FactoryBot.create(:user) }

      before do
        post '/signin', 
          params: { 
                    email: user1.email,
                    password: user1.password
                  }
        
        token = json['token']

        delete "/users/#{user1.id}", 
          headers: { 'Authorization' => "Bearer #{token}" }
      end

      it 'returns message upon destroy' do
        message = json['message']
        expect(message).to eq('Account deleted successfully')
      end

      it 'returns success code 200' do
        expect(response.status).to eq(200)
      end

      it 'returns a ok status 200' do
        expect(response).to have_http_status(:ok)
      end
    end


    context 'with invalid or missing token' do
      let!(:user1) { FactoryBot.create(:user) }

      before do
        post '/signin', 
          params: { 
                    email: user1.email,
                    password: user1.password
                  }
        
        token = json['token']

        delete "/users/#{user1.id}" 
      end

      it 'returns error code 401' do
        expect(response.status).to eq(401)
      end

      it 'returns a unauthorized entity status' do
        expect(response).to have_http_status(:unauthorized)
      end
    end

  end
end
