class PerformersController < ApplicationController

  def index
    @performers = Performer.all
  end

  def new
  end

  def edit
    @performer = Performer.find(params[:id])
  end

  def update
    @performer = Performer.find(params[:id])
    @performer.update(performer_params)
    redirect_to "/performers/#{@performer.id}"
  end

  # def create
  #   performer = Performer.create!(performer_params)
  # end

  def show
    @performer = Performer.find(params[:id])
  end

private
def performer_params
  params.permit(:name, :age, :repeater)
end


end
