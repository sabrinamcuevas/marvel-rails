require './app/workers/marvel_import_data_worker'

namespace :marvel do
  desc 'Synchronization of data brought from the official Marvel api'
  task :create_entities do
    puts '**** start of the data filling process ****'
    MarvelImportDataWorker.perform_async
    puts '**** end ****'
  end
end

