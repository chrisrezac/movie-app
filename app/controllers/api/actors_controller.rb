class Api::ActorsController < ApplicationController
  def single_actor_action
    @actor = Actor.first
    render "single_actor.json.jb"
  end

  def all_actors_action
    @actors = Actor.all
    render "all_actors.json.jb"
  end
end
