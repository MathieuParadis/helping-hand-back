require 'rails_helper'

RSpec.describe 'Requests', type: :request do
  describe 'POST /create' do

    context 'with valid parameters' do
      let!(:user1) { FactoryBot.create(:user) }

      before do
        post '/signin', 
          params: { 
                    email: user1.email,
                    password: user1.password
                  }

        token = json['token']

        post "/requests", 
          headers: { 'Authorization' => "Bearer #{token}" },
          params: { 
                    title: "Request title",
                    request_type: "material",
                    location: "Request location",
                    lat: 50,
                    lng: 50,
                    description: "Request description"
                  }    
      end


      it 'returns the id of the request that should match the id of the last created request' do
        request = json['request']
        expect(request['id']).to eq(Request.last.id)
      end

      it 'returns the title' do
        request = json['request']
        expect(request['title']).to eq('Request title')
      end

      it 'returns the type' do
        request = json['request']
        expect(request['request_type']).to eq('material')
      end

      it 'returns the location' do
        request = json['request']
        expect(request['location']).to eq('Request location')
      end

      it 'returns the latitude' do
        request = json['request']
        expect(request['lat']).to eq('50.0')
      end

      it 'returns the longitude' do
        request = json['request']
        expect(request['lng']).to eq('50.0')
      end

      it 'returns the description' do
        request = json['request']
        expect(request['description']).to eq('Request description')
      end

      it 'returns the default status' do
        request = json['request']
        expect(request['status']).to eq('in_progress')
      end

      it 'returns the count at 0' do
        request = json['request']
        expect(request['count']).to eq(0)
      end

      it 'returns message upon creation' do
        message = json['message']
        expect(message).to eq('Request created successfully')
      end

      it 'returns success code 201' do
        expect(response.status).to eq(201)
      end

      it 'returns a created status 201' do
        expect(response).to have_http_status(:created)
      end
    end


    context 'with invalid parameters' do
      let!(:user1) { FactoryBot.create(:user) }

      before do
        post '/signin', 
          params: { 
                    email: user1.email,
                    password: user1.password
                  }

        token = json['token']

        post "/requests", 
          headers: { 'Authorization' => "Bearer #{token}" },
          params: { 
                    title: "",
                    request_type: "",
                    location: "",
                    lat: 500,
                    lng: 500,
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
