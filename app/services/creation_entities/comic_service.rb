class CreationEntities::ComicService
  def initialize(comic:)
    @comic = {
      comic_id: comic['id'],
      serie_id: comic['serieId'],
      title: comic['title'],
      isbn: comic['isbn'],
      description: comic['description'],
      image_url: comic['thumbnail']['path'],
      extension: comic['thumbnail']['extension'],
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
