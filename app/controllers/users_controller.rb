class UsersController < ApplicationController
  before_action :set_user, only:[:show,:edit,:update,:destroy]
  before_action :authenticate_admin

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: 'User was Successfully Created'
    else
      render action: 'new'
    end
  end

  def update
    if user.update(user_params)
      redirect_to @user, notice: 'User was Successfully updated'
    else
      render action: 'new'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url
  end

  private
  def set_user
    @user = User.friendly.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username,:email,:avatar)
  end


end
