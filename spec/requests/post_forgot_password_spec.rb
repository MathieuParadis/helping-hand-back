require 'rails_helper'

RSpec.describe 'Password forgotten password', type: :request do
  describe 'POST /forgot' do

    context 'with valid parameters' do
      let!(:user1) { FactoryBot.create(:user) }

      before do
        post '/forgotten-password', 
          params: { 
                    email: user1.email
                  }
      end

      it 'returns success code 200' do
        expect(response.status).to eq(200)
      end

      it 'returns a ok status 200' do
        expect(response).to have_http_status(:ok)
      end
    end


    context 'with invalid parameters' do

      before do
        post '/forgotten-password', 
          params: { 
                    email: 'thisemaildoesnotexist@gmail.com'
                  }
      end

      it 'returns error message' do
        error = json['error']
        expect(error).to eq('Email address not found. Please check and try again')
      end

      it 'returns error code 404' do
        expect(response.status).to eq(404)
      end

      it 'returns not found status' do
        expect(response).to have_http_status(:not_found)
      end
    end
    

    context 'with empty email' do

      before do
        post '/forgotten-password', 
          params: { 
                    email: ''
                  }
      end

      it 'returns error message' do
        error = json['error']
        expect(error).to eq('Email field is empty')
      end
    end

  end
end
