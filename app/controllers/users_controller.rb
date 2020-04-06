class UsersController < ApplicationController
  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.save
    redirect_to("/users/index")
  end

  def index
    @users = User.all
  end
  
  def show
    @user = User.find_by(id: params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create 
    @user = User.create(name: params[:name], email: params[:email])
    if @user.save
      flash[:notice] = "Sign up completed"
      redirect_to("/users/index")
    else
      render("users/new")
    end
  end
end
