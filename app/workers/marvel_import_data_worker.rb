class MarvelImportDataWorker
  include Sidekiq::Worker

  def perform(*_args)
    comics = MarvelApi.new.comics['data']['results']
    comics.each do |comic|
      characters = MarvelApi.new.characters_by_comic(comic['id'])['data']['results']
      characters.each do |character|
        character['comic_id'] = comic['id']
        CreationEntities::CharacterService.new(character: character).call
      end

      creators = MarvelApi.new.creators_by_comic(comic['id'])['data']['results']
      creators.each do |creator|
        CreationEntities::CreatorService.new(creator: creator).call
        series = MarvelApi.new.series_by_creator(creator['id'])['data']['results']
        series.each do |serie|
          serie['creator_id'] = creator['id']
          CreationEntities::SerieService.new(serie: serie).call
          comic['serie_id'] = serie['id']
          CreationEntities::ComicService.new(comic: comic).call
        end
      end
    end
  end
end
