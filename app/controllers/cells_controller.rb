class CellsController < ApplicationController

  before_action :find_cell, only: [:show, :edit, :update, :destroy]

  def new
    @cell = Cell.new(sector_id: params[:sector_id])
  end

  def create
    @cell = Cell.create(create_params)
    if @cell.errors.empty?
      redirect_to @cell
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @cell.update(update_params)
    if @cell.errors.empty?
      redirect_to @cell
    else
      render :edit
    end
  end

  def destroy
    @cell.destroy
    redirect_to @cell.sector
  end

  private

  def create_params
    cell_attr = update_params
    cell_attr[:sector_id] = params.require(:sector_id)
    cell_attr
  end

  def update_params
    params.require(:cell).permit(:number)
  end

  def find_cell
    @cell = Cell.find(params[:id])
  end

end
