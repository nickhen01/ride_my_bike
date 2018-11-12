class BicyclesController < ApplicationController
  before_action :find_bicycle, only: [:show, :edit, :update, :destroy]

  def index
    @bicycles = Bicycle.all
  end

  def show
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

  private

  def bicycle_params
    params.require(:bicycle).permit(:price, :address, :user_id)
  end

  def find_bicycle
    @bicycle = Bicycle.find(params[:id])
  end
end
