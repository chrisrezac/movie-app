class Api::MoviesController < ApplicationController
  def single_movie_action
    @movie = Movie.first
    render "movie.json.jb"
  end

  def all_movies_action
    @movies = Movie.all
    render "all_movies.json.jb"
  end
  
end
