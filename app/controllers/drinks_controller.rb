class DrinksController < ApplicationController
  def index
    @drinks = Drink.is_alcoholic
  end

  def new
  end

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

  def destroy
    drink = Drink.find(params[:id])
    drink.destroy
    redirect_to "/drinks"
  end

  private
  def drink_params
    params.permit(:name, :cost, :alcoholic_bev)
  end
end
