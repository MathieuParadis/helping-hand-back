require 'rails_helper'

RSpec.describe 'Requests', type: :request do
  describe 'DELETE /destroy' do

    context 'with valid parameters' do
      let!(:user1) { FactoryBot.create(:user) }
      let!(:request1) { FactoryBot.create(:request, user: user1) }

      before do
        post '/signin', 
          params: { 
                    email: user1.email,
                    password: user1.password
                  }

        token = json['token']

        delete "/requests/#{request1.id}", 
          headers: { 'Authorization' => "Bearer #{token}" }  
      end

      it 'returns message upon delete' do
        message = json['message']
        expect(message).to eq('Request deleted successfully')
      end

      it 'returns success code 200' do
        expect(response.status).to eq(200)
      end

      it 'returns a ok status 200' do
        expect(response).to have_http_status(:ok)
      end
    end


    context 'with invalid parameters: deleting wrong request' do
      let!(:user1) { FactoryBot.create(:user) }
      let!(:user2) { FactoryBot.create(:user) }
      let!(:request1) { FactoryBot.create(:request, user: user1) }
      let!(:request2) { FactoryBot.create(:request, user: user2) }

      before do
        post '/signin', 
          params: { 
                    email: user1.email,
                    password: user1.password
                  }

        token = json['token']

        delete "/requests/#{request2.id}", 
          headers: { 'Authorization' => "Bearer #{token}" }  
      end

      it 'returns error message' do
        error = json['error']
        expect(error).to eq('You do not have the right to perform this action')
      end

      it 'returns success code 200' do
        expect(response.status).to eq(422)
      end

      it 'returns a ok status 200' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
    
  end
end
