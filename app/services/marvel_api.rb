class MarvelApi
  MARVEL_API_ENDPOINT = ENV['API_MARVEL']

  attr_reader :conn

  def initialize
    @conn = Faraday.new(url: MARVEL_API_ENDPOINT) do |f|
      f.response :json
    end
  end

  def characters(query_params = {})
    conn.get('characters', query_params.merge(authentication_params))
        .body
  end

  def characters_by_comic(id, query_params = {})
    conn.get("comics/#{id}/characters", query_params.merge(authentication_params))
        .body
  end

  def comics(query_params = {})
    conn.get('comics', query_params.merge(authentication_params))
        .body
  end

  def series_by_creator(id, query_params = {})
    conn.get("creators/#{id}/series", query_params.merge(authentication_params))
        .body
  end

  def creators_by_comic(id, query_params = {})
    conn.get("comics/#{id}/creators", query_params.merge(authentication_params))
        .body
  end

  private

  def authentication_params
    ts = timestamp
    { ts: ts,
      apikey: public_api_key,
      hash: generate_md5(ts) }
  end

  def public_api_key
    ENV['KEY']
  end

  def private_api_key
    ENV['PRIVATE_KEY']
  end

  def timestamp
    SecureRandom.urlsafe_base64
  end

  def generate_md5(timestamp)
    Digest::MD5.new.update("#{timestamp}#{private_api_key}#{public_api_key}").to_s
  end
end