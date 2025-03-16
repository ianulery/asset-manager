class DevicesController < ApplicationController
  before_action :find_device, except: [:index, :new, :create]

  def index
    @are_discarded_devices_shown = params[:show_discarded_devices].present? && ActiveRecord::Type::Boolean.new.cast(params[:show_discarded_devices])
    @devices = @are_discarded_devices_shown ? Device.all : Device.where(is_discarded: false)
  end

  def new
    @device = Device.new
    @device.location_id = params[:location_id] if params[:location_id].present?
    @device.person_id = params[:person_id] if params[:person_id].present?
  end

  def create
    @device = Device.new(device_params)
    if @device.save
      redirect_to @device
    else
      render :new
    end   
  end

  def edit
    render :new
  end

  def update
    if @device.update(device_params)
      redirect_to @device
    else
      render :new
    end
  end

  def destroy
    @device.destroy
    redirect_to devices_path
  end

  private

  def find_device
    @device = Device.find(params[:id])
  end

  def device_params
    params.require(:device).permit(
      :acquired_at,
      :anydesk_id,
      :is_discarded,
      :asset_number,
      :item,
      :location_id,
      :notes,
      :person_id
    )
  end
end
