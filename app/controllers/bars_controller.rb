class BarsController < ApplicationController
  def index
    @bars = Bar.all.order(created_at: :desc)
  end

  def new
  end

  def create
    Bar.create(bar_params)
# binding.pry
    redirect_to '/bars'
  end

  def show
    @bar = Bar.find(params[:id])
  end

  private
  def bar_params
    params.permit(:name, :employee_count, :license)
  end
end
