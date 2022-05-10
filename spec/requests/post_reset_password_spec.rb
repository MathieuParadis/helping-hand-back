require 'rails_helper'

RSpec.describe 'Password reset password', type: :request do
  describe 'POST /reset' do

    context 'with valid parameters' do
      let!(:user1) { FactoryBot.create(:user) }

      before do
        post '/forgotten-password', 
        params: { 
                  email: user1.email
                }

        post '/reset-password', 
          params: { 
                    email: user1.email,
                    password: "new_password",
                    token: user1.reset_password_token
                  }
      end

      # it 'returns error message' do
      #   # message = json['message']
      #   expect(user1.reset_password_token).to eq('You successfully reset your password')
      # end
     
      # it 'returns a ok status 200' do
      #   expect(response).to have_http_status(:ok)
      # end
    end


    # context 'with invalid parameters' do

    #   before do
    #     post '/reset-password', 
    #       params: { 
    #                 email: 'thisemaildoesnotexist@gmail.com'
    #               }
    #   end

    #   it 'returns error message' do
    #     error = json['error']
    #     expect(error).to eq('Email address not found. Please check and try again')
    #   end

    #   it 'returns error code 404' do
    #     expect(response.status).to eq(404)
    #   end

    #   it 'returns not found status' do
    #     expect(response).to have_http_status(:not_found)
    #   end
    # end
    

    # context 'with empty email' do

    #   before do
    #     post '/reset-password', 
    #       params: { 
    #                 email: ''
    #               }
    #   end

    #   it 'returns error message' do
    #     error = json['error']
    #     expect(error).to eq('Email field is empty')
    #   end
    # end

  end
end
