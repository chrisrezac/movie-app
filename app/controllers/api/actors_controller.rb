class Api::ActorsController < ApplicationController
  
  def index
    @actors = Actor.all.order(age: :desc)
    render "index_actors.json.jb"
  end

  def show
    actor_id = params[:id]
    @actor = Actor.find_by(id: actor_id)
    render "show_actor.json.jb"
  end

  def create
    @actor = Actor.create(
      first_name: params[:first_name],
      last_name: params[:last_name],
      known_for: params[:known_for],
      gender: params[:gender],
      age: params[:age],
      movie_plot: params[:movie_plot]
    )
    @actor.save
    render "show_actor.json.jb"
    if @movie.save
      render "show.json.jb"
    else
      render json: { errors: @movie.errors.full_messages }, status: unprocessable_entity
    end
  end

  def update
    actor_id = params[:id]
    @actor = Actor.find_by(id: actor_id)

    @actor.first_name = params[:first_name] || @actor.first_name
    @actor.last_name = params[:last_name] || @actor.last_name
    @actor.known_for = params[:known_for] || @actor.known_for
    @actor.gender = params[:gender] || @actor.gender
    @actors.age = params[:age] || @actor.age
    @actor.movie_plot = params[:movie_plot] || @actor.movie_plot

    @actor.save
    render "show_actor.json.jb"
    if @movie.save
      render "show.json.jb"
    else
      render json: { errors: @movie.errors.full_messages }, status: unprocessable_entity
    end
  end

  def destroy
    actor_id = params[:id]
    actors = Actor.find_by(id: actor_id)
    actors.destroy
    render json: {message: "Actor data deleted!"}
  end

end
