class RidesController < ApplicationController

  def create
    @ride = Ride.new(attraction_id: params[:attraction_id], user_id: current_user.id)
    if @ride.valid_rider
      @ride.save
    end
    @notice = @ride.take_ride
    redirect_to user_path(current_user, notice: @notice)
  end

end
