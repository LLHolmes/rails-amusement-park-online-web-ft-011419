class AttractionsController < ApplicationController
  before_action :current_attraction, only: [:show, :edit, :update]

  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    @attraction.save if current_user.admin
    redirect_to attraction_path(@attraction)
  end

  def show
  end

  def edit
  end

  def update
    @attraction.update(attraction_params) if current_user.admin
    redirect_to attraction_path(@attraction)
  end

  private
    def current_attraction
      @attraction = Attraction.find(params[:id])
    end

    def attraction_params
      params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
    end
end
