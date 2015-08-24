class SectorsController < ApplicationController

  before_action :set_constants
  before_action :find_sector, only: [:show, :edit, :update]
  
  def index
    @sectors = Sector.all
  end

  def new
    @sector = Sector.new
    @warehouses = Warehouse.all
  end

  def create
    @sector = Sector.create(sector_params)
    if @sector.errors.empty?
      redirect_to @sector
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    @sector.update(sector_params)
    if @sector.errors.empty?
      redirect_to @sector
    else
      render 'edit'
    end
  end

  private

  def sector_params
    params.require(:sector).permit(:number, :warehouse_id)
  end

  def find_sector
    @sector = Sector.find(params[:id])
  end

  def set_constants
    @top_bar_title = 'Секторы'
    @new_path = new_sector_path
  end

end
