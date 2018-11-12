class BicyclesController < ApplicationController
  def index
    @bicycles = Bicycle.all
  end

  def show
    @bicycle = Bicycle.find(params[:id])
  end

  def new
    @bicycle = Bicycle.new
  end

  def create
    @bicycle = Bicycle.new(bicycle_params)
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def bicycle_params
    params.require(:bicycle).permit(:price, :address, :user_id)
  end
end
