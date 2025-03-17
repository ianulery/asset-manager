class ReportsController < ApplicationController
  def index
  end

  def location_inventory
    @locations = Location.all
    render layout: false
  end

  def device_aging
    @devices = Device.where(is_discarded: false).order(acquired_at: :asc)
    render layout: false
  end
end
