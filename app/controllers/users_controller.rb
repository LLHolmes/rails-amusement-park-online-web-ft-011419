class UsersController < ApplicationController
  before_action :current_user, only: [:show, :index]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    return redirect_to new_user_path unless @user.save
    session[:user_id] = @user.id
    # binding.pry
    redirect_to user_path(@user)
  end

  def show
    return redirect_to root_path unless logged_in?
  end

  def index
    return redirect_to user_path(current_user) unless current_user.admin
  end

  private
  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
  end

end
