class CreationEntities::CharacterService
  def initialize(character:)
    @character = {
      character_id: character['id'],
      comic_id: character['comic_id'],
      name: character['name'],
      description: character['description'],
      image_url: character['resourceURI']
    }
  end

  def call
    character = Character.new(@character)
    return Success.new('Success') if character.save!

  rescue StandardError => e
    Failure.new({ errors: [e.message] })
  end
end