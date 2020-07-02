class FavoritesController < ApplicationController
    before_action :restrict_same_favorite, {only: [:create]}

    def restrict_same_favorite
        if @current_user
            @favorite = Favorite.find_by(
                user_id: @current_user.id,
                museum_id: params[:museum_id]
            )
            if @favorite
                redirect_to("/museums/#{params[:museum_id]}")
            end
        end
    end
    
    def create
        @favorite = Favorite.new(
            user_id: @current_user.id,
            museum_id: params[:museum_id]
        )
        @favorite.save
        redirect_to("/museums/#{params[:museum_id]}")
    end

    def destroy
        @favorite = Favorite.find_by(
            user_id: @current_user.id,
            museum_id: params[:museum_id]
        )
        @favorite.destroy
        redirect_to("/museums/#{params[:museum_id]}")
    end
end