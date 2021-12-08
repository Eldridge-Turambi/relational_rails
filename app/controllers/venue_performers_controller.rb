class VenuePerformersController < ApplicationController

  def index
    @venue = Venue.find(params[:id])

    if params[:age]
      @performers = Venue.age_filter(params[:age])
    else params[:sort]
      @performers = Performer.alpha_sort
    end
  end

  def new
    @venue = Venue.find(params[:id])
  end

  def create
    @venue = Venue.find(params[:id])
    @venue.performers.create(venue_performers_params)
    redirect_to "/venues/#{@venue.id}/performers"
  end

  private
    def venue_performers_params
      params.permit(:name, :age, :repeater, :venue_id)
    end
end
