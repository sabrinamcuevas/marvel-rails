require 'spec_helper'

describe 'Api::V1::SeriesController' do

  context 'series endpoints' do
    it 'fetches a list of series' do
      stub_get('series', 'series/series.json', 200)
      response = Net::HTTP.get("series", '/')
      expect(JSON.parse(response)['data'].size).to eq 10
    end

    it 'fetches a single serie by id' do
      stub_get('serie', 'series/serie.json', 200)
      response = Net::HTTP.get('serie', '/')
      expect(JSON.parse(response)['data']['serie_id']).to eq 5376
    end

    it 'search serie by id not valid' do
      stub_get('serie', 'errors/404.json', 404)
      response = Net::HTTP.get('serie', '/')
      expect(JSON.parse(response)['status']).to eq 404
    end

    it 'error in the parameters when creating a serie' do
      stub_post('serie', 'errors/400.json', 400)

      res = Net::HTTP.start('serie') do |http|
        req = Net::HTTP::Post.new('/')
        expect(JSON.parse(http.request(req).body)['status']).to eq 400
      end
    end
  end
end
