class Api::V1::UpvoteController < ApplicationController

  def update
    idea = Idea.find(params[:id])
    render json: idea.upvote
  end

end
