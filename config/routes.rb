Rails.application.routes.draw do

  resources :jam_circles
  resources :genres
  resources :instruments
  root 'pages#home'
  post 'clips/create'
  get 'users' => 'users#index'
  get 'login' => 'sessions#new'
  delete 'logout' => 'sessions#destroy'
  post 'sessions/create'
  get 'new_file' => 'clips#new'
  get 'music' => 'pages#music'
  get 'likes' => 'pages#likes'
  get 'search' => 'pages#search'
  get 'profile/:id' => 'pages#musical_preferences', as: :profile
  post 'search' => 'pages#search'
  resources :clips
  resources :users

  post 'like_clip/:clip_id' => 'users#like_clip'
  post 'dislike_clip/:clip_id' => 'users#dislike_clip'
  post 'reroute_to_likes_page_clip' => 'pages#reroute'
  get 'admin' => 'users#admin', as: :admin

  get 'tree_data/:id' => 'jam_circles#tree_data'

  # javaScript paths
  patch 'add_instrument/:instrument_id' => 'users#add_instrument'
  patch 'add_genre/:genre_id' => 'users#add_genre'
  post 'add_influence/:influence_name' => 'users#add_influence'

  patch 'add_instrument_partial' => 'pages#add_instrument_partial'
  patch 'add_genre_partial' => 'pages#add_genre_partial'
  patch 'add_influence_partial' => 'pages#add_influence_partial'

  patch 'rm_instrument/:instrument_id' => 'users#rm_instrument'
  patch 'rm_genre/:genre_id' => 'users#rm_genre'
  patch 'rm_influence/:influence_id' => 'users#rm_influence'

  patch 'report/:clip_id' =>'clips#report'

  # patch 'pages/cheat_activated'

end
