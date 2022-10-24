require 'spec_helper'

describe 'Api::V1::CreatorsController' do

  context 'creators endpoints' do
    it 'fetches a list of creators' do
      stub_get('creators', 'creators/creators.json', 200)
      response = Net::HTTP.get("creators", '/')
      expect(JSON.parse(response)['data'].size).to eq 10
    end

    it 'fetches a single creator by id' do
      stub_get('creator', 'creators/creator.json', 200)
      response = Net::HTTP.get('creator', '/')
      expect(JSON.parse(response)['data']['creator_id']).to eq 10021
    end

    it 'search creator by id not valid' do
      stub_get('creator', 'errors/404.json', 404)
      response = Net::HTTP.get('creator', '/')
      expect(JSON.parse(response)['status']).to eq 404
    end

    it 'error in the parameters when creating a creator' do
      stub_post('creator', 'errors/400.json', 400)

      res = Net::HTTP.start('creator') do |http|
        req = Net::HTTP::Post.new('/')
        expect(JSON.parse(http.request(req).body)['status']).to eq 400
      end
    end
  end
end
