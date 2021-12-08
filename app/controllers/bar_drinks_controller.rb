class BarDrinksController < ApplicationController
  def index
    @bar = Bar.find(params[:id])
    @drinks = Drink.alpha_sort
  end

  def new
    @bar = Bar.find(params[:id])
  end

  def create
    @bar = Bar.find(params[:id])

    bar_drink = @bar.drinks.create(bar_drinks_params)
    redirect_to "/bars/#{@bar.id}/drinks"
  end

  private

  def bar_drinks_params
    params.permit(:name, :cost, :alcoholic_bev, :bar_id)
  end
end
