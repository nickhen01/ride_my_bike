require 'open-uri'
require 'json'

class BicyclesController < ApplicationController
  before_action :find_bicycle, only: [:show, :edit, :update, :destroy, :area_by_postcode]

  def index
    @bicycles = Bicycle.all
  end

  def show
    area_by_postcode
  end

  def new
    @bicycle = Bicycle.new
  end

  def create
    @user = User.find(params[:user_id])
    @bicycle = Bicycle.new(bicycle_params)
    if @user.save
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

  private

  def bicycle_params
    params.require(:bicycle).permit(:price, :address, :user_id)
  end

  def find_bicycle
    @bicycle = Bicycle.find(params[:id])
  end
end
