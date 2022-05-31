require 'rails_helper'

RSpec.describe 'Requests', type: :request do
  describe 'PUT /update' do

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

        put "/requests/#{request1.id}", 
          headers: { 'Authorization' => "Bearer #{token}" },
          params: { 
                    title: "Request title updated",
                    request_type: "service",
                    location: "Request location updated",
                    lat: 70,
                    lng: 70,
                    description: "Request description updated"
                  }    
      end


      it 'returns the updated title' do
        request = json['request']
        expect(request['title']).to eq('Request title updated')
      end

      it 'returns the updated type' do
        request = json['request']
        expect(request['request_type']).to eq('service')
      end

      it 'returns the updated location' do
        request = json['request']
        expect(request['location']).to eq('Request location updated')
      end

      it 'returns the updated latitude' do
        request = json['request']
        expect(request['lat']).to eq('70.0')
      end

      it 'returns the updated longitude' do
        request = json['request']
        expect(request['lng']).to eq('70.0')
      end

      it 'returns the updated description' do
        request = json['request']
        expect(request['description']).to eq('Request description updated')
      end

      it 'returns the default status' do
        request = json['request']
        expect(request['status']).to eq('in_progress')
      end

      it 'returns the count at 0' do
        request = json['request']
        expect(request['count']).to eq(0)
      end

      it 'returns message upon update' do
        message = json['message']
        expect(message).to eq('Request updated successfully')
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
      let!(:request1) { FactoryBot.create(:request, user: user1) }

      before do
        post '/signin', 
          params: { 
                    email: user1.email,
                    password: user1.password
                  }

        token = json['token']

        put "/requests/#{request1.id}", 
          headers: { 'Authorization' => "Bearer #{token}" },
          params: { 
                    title: "",
                    request_type: "",
                    location: "",
                    lat: 700,
                    lng: 700,
                    description: ""
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
