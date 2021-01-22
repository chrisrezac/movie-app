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
      plot: params[:plot],
      director: params[:director],
      english: params[:english]
    )
    @movie.save
    render "show_movie.json.jb"
    if @movie.save
      render "show.json.jb"
    else
      render json: { errors: @movie.errors.full_messages }, status: unprocessable_entity
    end
  end

  def update
    movie_id = params[:id]
    @movie = Movie.find_by(id: movie_id)

    @movie.title = params[:title] || @movie.title
    @movie.year = params[:year] || @movie.year
    @movie.plot = params[:plot] || @movie.plot
    @movie.director = params[:director] || @movie.director
    @movie.english = params[:english] || @movie.english

    @movie.save
    render "show_movie.json.jb"
    if @movie.save
      render "show.json.jb"
    else
      render json: { errors: @movie.errors.full_messages }, status: unprocessable_entity
    end
  end

  def destroy
    movie_id = params[:id]
    movies = Movie.find_by(id: movie_id)
    movies.destroy
    render json: {message: "movie data deleted!"}
  end
end
