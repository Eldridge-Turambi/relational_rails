class DrinksController < ApplicationController
  def index
    @drinks = Drink.all
  end

  def new
  end

  # def create
  #   @drink = Drink.create(params[:id])
  # end

  def edit
    @drink = Drink.find(params[:id])
  end

  def update
    @drink = Drink.find(params[:id])

    @drink.update(drink_params)

    redirect_to "/drinks/#{@drink.id}"
  end

  def show
    @drink = Drink.find(params[:id])
  end

  private
  def drink_params
    params.permit(:name, :cost, :alcoholic_bev)
  end
end
