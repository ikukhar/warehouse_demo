class SectorsController < ApplicationController

  before_action :find_sector, only: [:show, :edit, :update, :destroy]

  def new
    @sector = Sector.new(warehouse_id: params[:warehouse_id])
  end

  def create
    @sector = Sector.create(create_params)
    if @sector.errors.empty?
      redirect_to @sector
    else
      render :new
    end
  end

  def show
    @cells = Cell.where("sector_id = ?", @sector).search(params[:search])
    respond_to do |format|
      format.json { render :json => @cells }
      format.html { render :show }
    end
  end

  def edit
  end

  def update
    @sector.update(update_params)
    if @sector.errors.empty?
      redirect_to @sector
    else
      render :edit
    end
  end

  def destroy
    @sector.destroy
    redirect_to @sector.warehouse
  end

  private

  def create_params
    sector_attr = update_params
    sector_attr[:warehouse_id] = params.require(:warehouse_id)
    sector_attr
  end
  
  def update_params
    params.require(:sector).permit(:number)
  end

  def find_sector
    @sector = Sector.find(params[:id])
  end

end
