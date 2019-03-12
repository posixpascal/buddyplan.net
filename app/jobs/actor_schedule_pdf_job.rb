class ActorSchedulePdfJob < ApplicationJob
  require "prawn"

  queue_as :default
  def perform(movie_id, actor_id)
    movie = Movie.find(movie_id)
    actor = movie.actors.find(actor_id)

  end
end
