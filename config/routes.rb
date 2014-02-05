Fitness::Application.routes.draw do
  devise_for :users

  # Login
  get '/auth/:facebook/callback' => 'user#oauth_create'

  # Populate Friends
  get '/auth/facebook/populate_friends' => 'user#populate_friends'

  #********** Static Pages ************#
  root :to => "static_pages#home_page"


  #********** Manage User Profile *****#
  get '/user/profile' => 'user#profile', as: 'user_profile' 


  #********* Dashboard **********#
  get '/home' => 'dashboard#home', as: 'dashboard'
  get '/:user_id/work_out_summary' => 'dashboard#user_work_out_summary', as: 'user_work_out_summary'

  #********* Workouts Controller ********#
  post '/workouts/add' => 'workouts#add', as: 'add_workout'
  post '/workouts/edit' => 'workouts#edit', as: 'edit_workout'

  #********* Group **********#
  get '/groups/:name' => 'group#show', as: 'show_group'
  post '/groups/:name/give_kudos' => 'group#give_kudos', as: 'give_kudos'

  
end
