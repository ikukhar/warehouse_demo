class WarehousesController < ApplicationController

  before_action :find_warehouse, only: [:show, :edit, :update, :destroy]

  def index
    @warehouses = Warehouse.all
  end

  def new
    @warehouse = Warehouse.new
  end

  def create
    @warehouse = Warehouse.create(warehouse_params)
    if @warehouse.errors.empty?
      redirect_to @warehouse
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    @warehouse.update(warehouse_params)
    if @warehouse.errors.empty?
      redirect_to @warehouse
    else
      render 'edit'
    end
  end

  def destroy
    @warehouse.destroy
    redirect_to warehouses_path
  end

  private

  def warehouse_params
    params.require(:warehouse).permit(:number)
  end

  def find_warehouse
    @warehouse = Warehouse.find(params[:id])
  end

end
