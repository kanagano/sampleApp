class UsersController < ApplicationController
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
      redirect_to("/users/#{@user.id}")
    else
      render("users/new")
    end
  end
end
