class PostsController < ApplicationController
  before_action :restrict_new_post, {only: [:new, :create]}
  before_action :forbid_others_edit, {only: [:edit, :update]}
  before_action :authenticate_user, {only: [:edit, :update, :new, :create]}
  
  def restrict_new_post
    @post = Post.find_by(user_id: @current_user.id, museum_id: params[:museum_id])
    if @post
      flash[:notice] = "すでにクチコミが存在します"
      redirect_to("/museums/#{params[:museum_id]}")
    end
  end

  def forbid_others_edit
    @post = Post.find_by(id: params[:id])
    if @current_user.id != @post.user_id
      flash[:notice] = "権限がありません"
      redirect_to("/users/#{@current_user.id}")
    end
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(
      user_id: @current_user.id,
      museum_id: params[:museum_id],
      star: params[:star].to_i,
      content: params[:content]
    )
    if @post.save
      flash[:notice] = "クチコミが投稿されました"
      redirect_to("/museums/#{params[:museum_id]}")
    else
      render("posts/new")
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.star = params[:star].to_i
    @post.content = params[:content]
    if @post.save
      flash[:notice] = "クチコミを編集しました"
      redirect_to("/museums/#{@post.museum_id}")
    else
      render("posts/edit")
    end
  end

end
