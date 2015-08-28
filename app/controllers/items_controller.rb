class ItemsController < ApplicationController

  before_action :find_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.search(params[:search])
  end

  def new
    @item = Item.new(cell_id: params[:cell_id])
  end

  def create
    @item = Item.create(create_params)
    if @item.errors.empty?
      redirect_to cell_path(@item.cell)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @item.update(update_params)
    if @item.errors.empty?
      redirect_to cell_path(@item.cell)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to @item.cell
  end

  private

  def create_params
    item_attr = update_params
    item_attr[:cell_id] = params.require(:cell_id)
    item_attr
  end

  def update_params
    params.require(:item).permit(:name, :foto_url, :count, :max_cell_count)
  end

  def find_item
    @item = Item.find(params[:id])
  end

end
