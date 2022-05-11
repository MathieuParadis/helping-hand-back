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

      it 'returns the id_card_url' do
        user = json['user']
        expect(user['id_card_url']).to eq(User.last.id_card_url)
      end

      it 'reset password token to null' do
        user = json['user']
        expect(user['reset_password_token']).to eq(nil)
      end

    end




  end
end
