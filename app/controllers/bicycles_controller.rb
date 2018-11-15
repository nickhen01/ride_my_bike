require 'open-uri'
require 'json'

class BicyclesController < ApplicationController
  before_action :find_bicycle, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @bicycles = Bicycle.all
  end

  def show
    area_by_postcode(@bicycle)
    @booking = Booking.new
  end

  def new
    @bicycle = Bicycle.new
  end

  def create
    @bicycle = Bicycle.new(bicycle_params)
    @bicycle.user = current_user
    @bicycle = lon_and_lat(@bicycle)
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
    @bicycle = lon_and_lat(@bicycle)
    if @bicycle.save
      redirect_to bicycle_path(@bicycle)
    else
      render :edit
    end
  end

  def destroy
    @bicycle.destroy
  end

  def area_by_postcode(bicycle)
    if !bicycle
      bicycle = Bicycle.find(params[:id])
    end
    url = "https://api.postcodes.io/postcodes/#{bicycle.post_code.delete(" ")}"
    response = JSON.parse(open(url).read)
    response["result"]["admin_district"]
  end

  def search_results
    @query = params[:query]
    @bicycles = Bicycle.search_bikes(params[:query])
    map
    redirect_to no_results_path if @bicycles.empty?
  end

  def lon_and_lat(bicycle)
    url = "https://api.postcodes.io/postcodes/#{@bicycle.post_code.delete(" ")}"
    response = JSON.parse(open(url).read)
    bicycle.latitude = response["result"]["latitude"]
    bicycle.longitude = response["result"]["longitude"]
    bicycle.area = area_by_postcode(bicycle)
    bicycle
  end

  def map
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
    params.require(:bicycle).permit(:brand, :model, :user_id, :post_code, :description, :price, :photo, :longitude, :latitude, :area)
  end

  def find_bicycle
    @bicycle = Bicycle.find(params[:id])
  end
end
