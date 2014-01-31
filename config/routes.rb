Fitness::Application.routes.draw do
  devise_for :users

  # Login
  get '/auth/:facebook/callback' => 'user#oauth_create'

  # Populate Friends
  get '/auth/facebook/populate_friends' => 'user#populate_friends'

  #********** Static Pages ************#
  root :to => "static_pages#home_page"


  
end
