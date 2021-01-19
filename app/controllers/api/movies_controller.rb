class Api::MoviesController < ApplicationController

  def index
    @movies = Movie.all
    render "index_movies.json.jb"
  end

  def show
    movie_id = params[:id]
    @movie = Movie.find_by(id: movie_id)
    render "show_movie.json.jb"
  end

  def create
    @movie = Movie.create(
      title: params[:title],
      year: params[:year],
      plot: params[:plot]
    )
    @movie.save
    render "show_movie.json.jb"
  end

  def update
    movie_id = params[:id]
    @movie = Movie.find_by(id: movie_id)

    @movie.title = params[:title] || @movie.title
    @movie.year = params[:year] || @movie.year
    @movie.plot = params[:plot] || @movie.plot

    @movie.save
    render "show_movie.json.jb"
  end

  def destroy
    movie_id = params[:id]
    movies = Movie.find_by(id: movie_id)
    movies.destroy
    render json: {message: "movie data deleted!"}
  end
end
