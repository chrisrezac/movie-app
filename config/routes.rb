Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  # namespace :api do
  #   get "/photos" => "photos#index"
  # end

  namespace :api do
    get "actor_path" => "actors#single_actor_action"
    get "all_actors_path" => "actors#all_actors_action"
    get "movie_path" => "movies#single_movie_action"
    get "all_movies_path" => "movies#all_movies_action"
  end

end
