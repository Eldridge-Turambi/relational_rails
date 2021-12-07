class VenuePerformersController < ApplicationController

  def index
    @venue = Venue.find(params[:id])
    @performers = @venue.performers
  end

  def new
  end
end
