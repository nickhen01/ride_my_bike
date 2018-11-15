require 'open-uri'
require 'json'

class BicyclesController < ApplicationController
  before_action :find_bicycle, only: [:show, :edit, :update, :destroy, :area_by_postcode]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @bicycles = Bicycle.all
    map
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
    lon_and_lat
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
    redirect_to no_results_path if @bicycles.empty?
  end

  def lon_and_lat
    url = "https://api.postcodes.io/postcodes/#{@bicycle.post_code.delete(" ")}"
    response = JSON.parse(open(url).read)
    @bicycle.latitude = response["result"]["latitude"]
    @bicycle.longitude = response["result"]["longitude"]

  end

  def map
    @bicycles = Bicycle.where.not(latitude: nil, longitude: nil)

    @markers = @bicycles.map do |bicycle|
      {
        lng: bicycle.longitude,
        lat: bicycle.latitude,
        infoWindow: { content: render_to_string(partial: "/bicycles/map_window", locals: { bicycle: bicycle }) }
      }
    end
  end

  private

  def bicycle_params
    params.require(:bicycle).permit(:brand, :model, :user_id, :post_code, :description, :price, :photo)
  end

  def find_bicycle
    @bicycle = Bicycle.find(params[:id])
  end
end
