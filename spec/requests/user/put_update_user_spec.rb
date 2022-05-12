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
                    email: "silverster.stalone@gmail.com",
                    password: 'azerty456',
                    password_confirmation: 'azerty456',
                    id_card: Rack::Test::UploadedFile.new('spec/files/IDcard.pdf', 'application/pdf')
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

      it 'returns the email' do
        user = json['user']
        expect(user['email']).to eq('silverster.stalone@gmail.com')
      end

      it 'returns the updated id_card_url' do
        user = json['user']
        expect(user['id_card_url'].split('/').last).to eq('IDcard.pdf')
      end

      it 'returns message upon update' do
        message = json['message']
        expect(message).to eq('User profile updated succesfully')
      end

      it 'returns success code 200' do
        expect(response.status).to eq(200)
      end

      it 'returns a ok status 200' do
        expect(response).to have_http_status(:ok)
      end
    end

    
    context 'with invalid parameters: first name and last name too short' do
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

                    first_name: "S",
                    lase_name: "S",
                  }    
      end

      it 'returns error code 406' do
        expect(response.status).to eq(406)
      end

      it 'returns a not acceptable status' do
        expect(response).to have_http_status(:not_acceptable)
      end
    end


    context 'with invalid parameters: email already in use' do
      let!(:user1) { FactoryBot.create(:user) }
      let!(:user2) { FactoryBot.create(:user, email: 'user@example.com') }

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
                    email: "user@example.com",
                  }    
      end

      it 'returns error code 406' do
        expect(response.status).to eq(406)
      end

      it 'returns a not acceptable status' do
        expect(response).to have_http_status(:not_acceptable)
      end
    end


    context 'with invalid parameters: password confirmation missing' do
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
                    password: "azerty456",
                  }    
      end

      it 'returns error code 406' do
        expect(response.status).to eq(406)
      end

      it 'returns a not acceptable status' do
        expect(response).to have_http_status(:not_acceptable)
      end
    end


    context 'with invalid parameters: password and password confirmation different' do
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
                    password: "azerty456",
                    password_confirmation: "azerty789",
                  }    
      end

      it 'returns error message' do
        error = json['error']
        expect(error).to eq('Password and password confirmation are different')
      end

      it 'returns error code 406' do
        expect(response.status).to eq(406)
      end

      it 'returns a not acceptable status' do
        expect(response).to have_http_status(:not_acceptable)
      end
    end


    context 'with invalid parameters: password and password confirmation too short' do
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
                    password: "az",
                    password_confirmation: "az",
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
