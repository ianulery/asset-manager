class LocationsController < ApplicationController
  before_action :find_location, except: [:index, :new, :create]

  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
  end

  def create
    redirect_to Location.create(location_params)
  end

  def edit
    render :new
  end

  def update
    if @location.update(location_params)
      redirect_to @location
    else
      render :new
    end
  end

  def destroy
    @location.destroy
    redirect_to locations_path
  end

  private

  def find_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:name, :notes, person_ids: [])
  end
end
