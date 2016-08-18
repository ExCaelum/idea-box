class Api::V1::IdeasController < ApplicationController

  def index
    render json: Idea.all
  end

  def create
    idea = Idea.new(idea_params)
    if idea.save
      render json: idea
    else
      render json: {error: "invalid Data"}
    end
  end

  def update
    render json: Idea.update(params[:id], idea_params)
  end

  def destroy
    render json: Idea.destroy(params[:id])
  end

  private

  def idea_params
    params.permit(:title, :body, :quality)
  end

end
