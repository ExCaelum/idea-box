class Api::V1::DownvoteController < ApplicationController

  def update
    idea = Idea.find(params[:id])
    render json: idea.downvote
  end

end
