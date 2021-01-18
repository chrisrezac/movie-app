class Api::ActorsController < ApplicationController
  def single_actor_action
    @actor = Actor.first
    render "single_actor.json.jb"
  end

  def all_actors_action
    @actors = Actor.all
    render "all_actors.json.jb"
  end

  def show
    actor_id = params[:id]
    @actor = Actor.find_by(id: actor_id)
    render "single_actor.json.jb"
  end
end
