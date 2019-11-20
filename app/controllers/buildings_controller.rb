class BuildingsController < ApplicationController

  def index
    @buildings = Building.all
  end

  def show
    building_finder
  end

  def edit
    building_finder
  end

  def update
    building_finder
    @building.update(building_params)
    if @building.save
      redirect_to building_path(@building)
    else
      render :edit
    end
  end


  private

  def building_finder
    @building = Building.find(params[:id])
  end

  def building_params
    params.require(:building).permit(:name, :country, :address, :rent_per_floor, :number_of_floors)
  end

end