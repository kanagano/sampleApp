class LikesController < ApplicationController
    before_action :restrict_same_like, {only: [:create]}

    def restrict_same_like
        @like = Like.find_by(
            user_id: @current_user.id,
            post_id: params[:post_id]
        )
        @post = Post.find_by(id: params[:post_id])
        if @like
            redirect_to("/museums/#{@post.museum_id}")
        end
    end
    
    def create
        @like = Like.new(
            user_id: @current_user.id,
            post_id: params[:post_id]
        )
        @like.save
        @post = Post.find_by(id: @like.post_id)
        redirect_to("/museums/#{@post.museum_id}")
    end

    def destroy
        @like = Like.find_by(
            user_id: @current_user.id,
            post_id: params[:post_id]
        )
        @like.destroy
        @post = Post.find_by(id: params[:post_id])
        redirect_to("/museums/#{@post.museum_id}")
    end
end