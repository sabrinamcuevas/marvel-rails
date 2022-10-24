class CreationEntities::SerieService
  def initialize(serie:)
    @serie = {
      serie_id: serie['id'],
      creator_id: serie['creatorId'],
      title: serie['title'],
      description: serie['description'],
      start_year: serie['startYear'],
      end_year: serie['startYear'],
      image_url: serie['thumbnail']['path'],
      extension: serie['thumbnail']['extension'],
      rating: serie['rating']
    }
  end

  def call
    serie = Serie.new(@serie)
    return Success.new('Success') if serie.save!

  rescue StandardError => e
    Failure.new({ errors: [e.message] })
  end
end