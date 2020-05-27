class MuseumsController < ApplicationController
  def index 
    @museums = Museum.all.page(params[:page]).per(10)
  end

  def show
    @museum = Museum.find_by(id: params[:id])
    
    @posts = Post.where(museum_id: params[:id])
  end

  def search
    if params[:name].present?
      @museums = Museum.where('name LIKE ?', "%#{params[:name]}%").page(params[:page]).per(10)
    else
      @museums = Museum.none.page(params[:page]).per(10)
    end
  end
end
