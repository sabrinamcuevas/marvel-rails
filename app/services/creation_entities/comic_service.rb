class CreationEntities::ComicService
  def initialize(comic:)
    @comic = {
      comic_id: comic['id'],
      serie_id: comic['serie_id'],
      title: comic['title'],
      isbn: comic['isbn'],
      description: comic['description'],
      image_url: comic['resourceURI'],
      page_count: comic['pageCount']
    }
  end

  def call
    comic = Comic.new(@comic)
    return Success.new('Success') if comic.save!

  rescue StandardError => e
    Failure.new({ errors: [e.message] })
  end
end
