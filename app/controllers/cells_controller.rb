class CellsController < ApplicationController
  def index
    @cells = Cell.all.order(:number)
  end

  def new
    @cell = Cell.new
    @sectors = Sector.all.order(:number)
  end

  def create
    @cell = Cell.create(cell_params)
    if @cell.errors.empty?
      redirect_to @cell
    else
      render 'new'
    end
  end

  def show
    @cell = Cell.find(params[:id])
  end

  def edit
    @cell = Cell.find(params[:id])
  end

  def update
    @cell = Cell.find(params[:id])
    @cell.update(cell_params)
    if @cell.errors.empty?
      redirect_to @cell
    else
      render 'edit'
    end
  end

  private

  def cell_params
    params.require(:cell).permit(:number)
  end
end
