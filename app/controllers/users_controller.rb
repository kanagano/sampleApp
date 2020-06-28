class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:show, :favorites, :edit, :update]}
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
  before_action :ensure_correct_user, {only: [:show, :favorites, :edit, :update]}

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]
    if @user.save
      flash[:notice] = "プロフィールを編集しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end
  end

  def index
    @users = User.all
  end
  
  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts.order("updated_at DESC").first(3)
  end
  
  def favorites
    @user = User.find_by(id: params[:id])
    @museums = @user.museums.page(params[:page]).per(2)
  end
  
  def new
    @user = User.new
  end
  
  def create 
    @user = User.create(name: params[:name], email: params[:email], password: params[:password])
    if @user.save
      Notification.create(visitor_id: @user.id, visited_id: @user.id, action: 'signup')
      session[:user_id] = @user.id
      flash[:notice] = "アカウントが作成されました"
      redirect_to("/users/#{@user.id}")
    else
      @error_message = "正しい値を入力してください"
      render("users/new")
    end
  end

  def login_form
  end

  def login
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "ログインに成功しました"
      redirect_to("/users/#{@user.id}")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/")
  end

  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice]="権限がありません"
      redirect_to("/")
    end
  end
end