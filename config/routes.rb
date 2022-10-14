Rails.application.routes.draw do
  # API
  namespace :api do
    namespace :v1 do
      post 'creator', to: 'creators#create'
      post 'character', to: 'characters#create'
      post 'comic', to: 'comics#create'
      post 'serie', to: 'series#create'

      get 'creators', to: 'creators#creators'
      get 'characters', to: 'characters#characters'
      get 'comics', to: 'comics#comics'
      get 'series', to: 'series#series'

      get 'creator/:id', to: 'creators#creator'
      get 'character/:id', to: 'characters#character'
      get 'comic/:id', to: 'comics#comic'
      get 'serie/:id', to: 'series#serie'
    end
  end
end
