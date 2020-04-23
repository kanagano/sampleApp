class MuseumsController < ApplicationController
  def index
    @museums = Museum.all
  end

  def show
    @museum = Museum.find_by(id: params[:id])
    @posts = Post.where(museum_id: params[:id])
  end
end
