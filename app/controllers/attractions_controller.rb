class AttractionsController < ApplicationController
  before_action :redirect_unless_admin, only: [:new, :create, :edit, :update]
  before_action :set_attraction!, only: [:show, :edit, :update]

  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def update
    @attraction.update(attraction_params)
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  private
  
  def set_attraction!
    @attraction = Attraction.find(params[:id])
  end

  def redirect_unless_admin
    redirect_to root_path unless current_user.admin
  end

  def attraction_params
    params.require(:attraction).permit(:name, :happiness_rating, :nausea_rating, :tickets, :min_height)
  end
end
