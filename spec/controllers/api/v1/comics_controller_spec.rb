require 'spec_helper'

describe 'Api::V1::ComicsController' do

  context 'comics endpoints' do
    it 'fetches a list of comics' do
      stub_get('comics', 'comics/comics.json', 200)
      response = Net::HTTP.get("comics", '/')
      expect(JSON.parse(response)['data'].size).to eq 10
    end

    it 'fetches a single comic by id' do
      stub_get('comic', 'comics/comic.json', 200)
      response = Net::HTTP.get('comic', '/')
      expect(JSON.parse(response)['data']['comic_id']).to eq 1308
    end

    it 'search comic by id not valid' do
      stub_get('comic', 'errors/404.json', 404)
      response = Net::HTTP.get('comic', '/')
      expect(JSON.parse(response)['status']).to eq 404
    end

    it 'error in the parameters when creating a comic' do
      stub_post('comic', 'errors/400.json', 400)

      res = Net::HTTP.start('comic') do |http|
        req = Net::HTTP::Post.new('/')
        expect(JSON.parse(http.request(req).body)['status']).to eq 400
      end
    end
  end
end
