require 'rails_helper'

RSpec.describe 'User update', type: :request do
  describe 'PUT /update' do

    context 'with valid parameters' do
      let!(:user1) { FactoryBot.create(:user) }

      before do
        post '/signin', 
          params: { 
                    email: user1.email,
                    password: user1.password
                  }

        token = json['token']

        put "/users/#{user1.id}", 
          headers: { 'Authorization' => "Bearer #{token}" },
          params: { 
                    first_name: "Silverster",
                    last_name: "Stalone",
                  }    
      end

      it 'returns the updated first_name' do
        user = json['user']
        expect(user['first_name']).to eq('Silverster')
      end

      it 'returns updated the last_name' do
        user = json['user']
        expect(user['last_name']).to eq('Stalone')
      end

      # it 'returns the email' do
      #   user = json['user']
      #   expect(user['email']).to eq('jason.statam@gmail.com')
      # end

      # it 'expects newly created instance to have id card attached' do
      #   expect(User.last.id_card.attached?).to eq(true)
      # end

      # it 'returns the id_card_url' do
      #   user = json['user']
      #   expect(user['id_card_url']).to be_present
      # end

      # it 'reset password token to null' do
      #   user = json['user']
      #   expect(user['reset_password_token']).to eq(nil)
      # end

      # it 'returns message upon registration' do
      #   message = json['message']
      #   expect(message).to eq('Account created successfully')
      # end

      # it 'returns token that identifies a user' do
      #   token = json['token']
      #   expect(token).to be_present
      # end

      # it 'returns success code 201' do
      #   expect(response.status).to eq(201)
      # end

      # it 'returns a created status 201' do
      #   expect(response).to have_http_status(:created)
      # end

    end


    # context 'with invalid parameters: text fields empty' do
    #   before do
    #     post '/signup', 
    #       params: { 
    #                 first_name: '',
    #                 last_name: '',
    #                 email: '',
    #                 password: '',
    #                 password_confirmation: '',
    #                 id_card: Rack::Test::UploadedFile.new('spec/files/IDcard.png', 'image/png')
    #               }          
    #   end

    #   it 'returns error code 406' do
    #     expect(response.status).to eq(406)
    #   end

    #   it 'returns a not acceptable status' do
    #     expect(response).to have_http_status(:not_acceptable)
    #   end
    # end

  end
end
