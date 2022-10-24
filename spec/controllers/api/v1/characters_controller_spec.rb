require 'spec_helper'

describe 'Api::V1::CharactersController' do

  context 'characters endpoints' do
    it 'fetches a list of characters' do
      stub_get('characters', 'characters/characters.json', 200)
      response = Net::HTTP.get("characters", '/')
      expect(JSON.parse(response)['data'].size).to eq 10
    end

    it 'fetches a single character by id' do
      stub_get('character', 'characters/character.json', 200)
      response = Net::HTTP.get('character', '/')
      expect(JSON.parse(response)['data']['character_id']).to eq 1009313
    end

    it 'search character by id not valid' do
      stub_get('character', 'errors/404.json', 404)
      response = Net::HTTP.get('character', '/')
      expect(JSON.parse(response)['status']).to eq 404
    end

    it 'error in the parameters when creating a character' do
      stub_post('character', 'errors/400.json', 400)

      res = Net::HTTP.start('character') do |http|
        req = Net::HTTP::Post.new('/')
        expect(JSON.parse(http.request(req).body)['status']).to eq 400
      end
    end
  end
end
