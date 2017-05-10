class UsersController < ApplicationController
  before_action :set_user!, only: [:show, :update]
  include RideHelper

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  def show
    redirect_to root_path unless logged_in?
  end

  def update
    @ride = Ride.create(user_id: @user.id, attraction_id: params[:attraction][:attraction_id])
    flash[:notice] = @ride.take_ride
    redirect_to user_path(@user)
  end

  private
  def set_user!
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :height, :tickets, :nausea, :happiness, :password, :admin)
  end
end
