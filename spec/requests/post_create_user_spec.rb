# require 'rails_helper'

# RSpec.describe 'User registration', type: :request do
#   describe 'POST /create' do

#     context 'with valid parameters' do
#       let!(:user1) { FactoryBot.build(:user) }

#       before do
#         post '/signup', 
#           params: { 
#                     user: {
#                       first_name: user1.first_name,
#                       last_name: user1.last_name,
#                       email: user1.email,
#                       password: user1.password,
#                       password_confirmation: user1.password_confirmation,
#                       id_card: Rack::Test::UploadedFile.new('spec/files/IDcard.png', 'image/png'),
#                     }
#                   }
#       end

#       it 'returns the first_name' do
#         expect(json['first_name']).to eq(user1.first_name)
#       end

#       # it 'returns the last_name' do
#       #   expect(json['last_name']).to eq(user1.last_name)
#       # end

#       # it 'returns the email' do
#       #   expect(json['email']).to eq(user1.email)
#       # end

#       # it 'returns the slogan' do
#       #   expect(json['slogan']).to eq(user1.slogan)
#       # end
#     end


#     # context 'with invalid parameters' do
#     #   before do
#     #     post '/slogan_contests', params:
#     #                       { slogan_contest: {
#     #                         first_name: '',
#     #                         last_name: '',
#     #                         email: '',
#     #                         slogan: ''
#     #                       } }
#     #   end

#     #   it 'returns a unprocessable entity status' do
#     #     expect(response).to have_http_status(:unprocessable_entity)
#     #   end
#     # end


#   end
# end
