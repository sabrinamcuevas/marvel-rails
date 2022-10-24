class CreationEntities::CreatorService
  def initialize(creator:)
    @creator = {
      creator_id: creator['id'],
      first_name: creator['firstName'],
      last_name: creator['lastName'],
      image_url: creator['thumbnail']['path'],
      extension: creator['thumbnail']['extension'],
    }
  end

  def call
    creator = Creator.new(@creator)
    return Success.new('Success') if creator.save!
  rescue StandardError => e
    Failure.new({ errors: [e.message] })
  end
end
