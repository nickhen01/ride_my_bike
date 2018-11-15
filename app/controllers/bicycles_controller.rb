require 'open-uri'
require 'json'

class BicyclesController < ApplicationController
  before_action :find_bicycle, only: [:show, :edit, :update, :destroy, :area_by_postcode]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @bicycles = Bicycle.all
  end

  def show
    area_by_postcode
    @booking = Booking.new
  end

  def new
    @bicycle = Bicycle.new
  end

  def create
    @bicycle = Bicycle.new(bicycle_params)
    @bicycle.user = current_user
    if @bicycle.save
      redirect_to bicycle_path(@bicycle)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @bicycle.update(bicycle_params)
    redirect_to bicycle_path(@bicycle)
  end

  def destroy
    @bicycle.destroy
  end

  def area_by_postcode
    url = "https://api.postcodes.io/postcodes/#{@bicycle.post_code.delete(" ")}"
    response = JSON.parse(open(url).read)
    @area = response["result"]["admin_district"]
  end

  def search_results
    @bicycles = Bicycle.search_bikes(params[:query])
  end

  private

  def bicycle_params
    params.require(:bicycle).permit(:brand, :model, :user_id, :post_code, :description, :price, :photo)
  end

  def find_bicycle
    @bicycle = Bicycle.find(params[:id])
  end
end
