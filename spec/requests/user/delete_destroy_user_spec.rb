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


    context 'with invalid parameters' do
      let!(:user1) { FactoryBot.create(:user) }

      before do
        post '/signin', 
          params: { 
                    email: user1.email,
                    password: user1.password
                  }
        
        token = json['token']

        delete "/users", 
          headers: { 'Authorization' => "Bearer #{token}" }
      end

      it 'returns error code 422' do
        expect(response.status).to eq(422)
      end

      it 'returns a unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

  end
end
