require 'rails_helper'

RSpec.describe 'User registration', type: :request do
  describe 'POST /create' do

    context 'with valid parameters' do

      before do
        post '/signup', 
          params: { 
                    first_name: "Jason",
                    last_name: "Statam",
                    email: "jason.statam@gmail.com",
                    password: 'azerty123',
                    password_confirmation: 'azerty123',
                    id_card: Rack::Test::UploadedFile.new('spec/files/IDcard.png', 'image/png')
                  }          
      end

      it 'returns the id of the user that should match the id of the last created user' do
        user = json['user']
        expect(user['id']).to eq(User.last.id)
      end

      it 'returns the first_name' do
        user = json['user']
        expect(user['first_name']).to eq('Jason')
      end

      it 'returns the last_name' do
        user = json['user']
        expect(user['last_name']).to eq('Statam')
      end

      it 'returns the email' do
        user = json['user']
        expect(user['email']).to eq('jason.statam@gmail.com')
      end

      it 'expects newly created instance to have id card attached' do
        expect(User.last.id_card.attached?).to eq(true)
      end

      it 'returns the id_card_url' do
        user = json['user']
        expect(user['id_card_url'].split('/').last).to eq('IDcard.png')
      end

      it 'reset password token to null' do
        user = json['user']
        expect(user['reset_password_token']).to eq(nil)
      end

      it 'returns message upon registration' do
        message = json['message']
        expect(message).to eq('Account created successfully')
      end

      it 'returns token that identifies a user' do
        token = json['token']
        expect(token).to be_present
      end

      it 'returns success code 201' do
        expect(response.status).to eq(201)
      end

      it 'returns a created status 201' do
        expect(response).to have_http_status(:created)
      end

    end


    context 'with invalid parameters: text fields empty' do
      before do
        post '/signup', 
          params: { 
                    first_name: '',
                    last_name: '',
                    email: '',
                    password: '',
                    password_confirmation: '',
                    id_card: Rack::Test::UploadedFile.new('spec/files/IDcard.png', 'image/png')
                  }          
      end

      it 'returns error code 406' do
        expect(response.status).to eq(406)
      end

      it 'returns a not acceptable status' do
        expect(response).to have_http_status(:not_acceptable)
      end
    end


    context 'with invalid parameters: wrong file type' do
      before do
        post '/signup', 
                  params: { 
                    first_name: "Jason",
                    last_name: "Statam",
                    email: "jason.statam@gmail.com",
                    password: 'azerty123',
                    password_confirmation: 'azerty123',
                    id_card: Rack::Test::UploadedFile.new('spec/files/IDcard.doc', 'application/doc')
                  }          
      end

      it 'returns error code 406' do
        expect(response.status).to eq(406)
      end

      it 'returns a not acceptable status' do
        expect(response).to have_http_status(:not_acceptable)
      end
    end

  end
end
