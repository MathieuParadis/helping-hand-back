require 'rails_helper'

RSpec.describe 'User login', type: :request do
  describe 'POST /login' do

    context 'with valid parameters' do
      let!(:user1) { FactoryBot.create(:user) }

      before do
        post '/signin', 
          params: { 
                    email: user1.email,
                    password: user1.password
                  }
      end

      it 'returns the id' do
        user = json['user']
        expect(user['id']).to eq(user1.id)
      end

      it 'returns the first_name' do
        user = json['user']
        expect(user['first_name']).to eq(user1.first_name)
      end

      it 'returns the last_name' do
        user = json['user']
        expect(user['last_name']).to eq(user1.last_name)
      end

      it 'returns the email' do
        user = json['user']
        expect(user['email']).to eq(user1.email)
      end

      it 'returns the id_card_url' do
        user = json['user']
        expect(user['id_card_url']).to eq(user1.id_card_url)
      end

      it 'returns message upon login' do
        message = json['message']
        expect(message).to eq('Logged in successfully')
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
                    email: '',
                    password: ''
                  }
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
