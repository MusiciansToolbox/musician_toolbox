Rails.application.routes.draw do

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
  get 'musical_preferences/:id' => 'pages#musical_preferences', as: :musical_preferences
  resources :clips
  resources :users
  get 'users/:id' => 'users#show', as: :profile
  patch 'add_instrument/:instrument_id' => 'users#add_instrument'
  patch 'add_genre/:genre_id' => 'users#add_genre'
  patch 'add_instrument_partial' => 'pages#add_instrument_partial'
  patch 'add_genre_partial' => 'pages#add_genre_partial'
  patch 'rm_instrument/:instrument_id' => 'users#rm_instrument'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
