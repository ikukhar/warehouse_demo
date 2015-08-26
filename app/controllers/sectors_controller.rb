class SectorsController < ApplicationController

  before_action :find_sector, only: [:show, :edit, :update, :destroy]

  def index
    @sectors = Sector.all
  end

  def new
    @sector = Sector.new(warehouse_id: params[:warehouse_id])
  end

  def create
    @sector = Sector.create(create_params)
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
    @sector.update(create_params)
    if @sector.errors.empty?
      redirect_to @sector
    else
      render 'edit'
    end
  end

  def destroy
    @sector.destroy
    redirect_to @sector.warehouse
  end

  private

  def create_params
    params.require(:sector).permit(:number, :warehouse_id)
  end

  def find_sector
    @sector = Sector.find(params[:id])
  end

end
