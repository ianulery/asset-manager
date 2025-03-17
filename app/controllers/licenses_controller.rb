class LicensesController < ApplicationController
  before_action :find_license, except: [:index, :new, :create]

  def index
    @licenses = License.all
  end

  def new
    @license = License.new
  end

  def create
    @license = License.new(license_params)
    if @license.save
      redirect_to @license
    else
      render :new
    end
  end

  def edit
    render :new
  end

  def update
    if @license.update(license_params)
      redirect_to @license
    else
      render :new
    end
  end

  def destroy
    @license.destroy
    redirect_to licenses_path
  end

  private

  def find_license
    @license = License.find(params[:id])
  end

  def license_params
    params.require(:license).permit(:item, :key, :device_id, :notes)
  end
end