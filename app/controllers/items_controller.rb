class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.errors.empty?
      redirect_to @item
    else
      render 'new'
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.errors.empty?
      redirect_to @item
    else
      render 'edit'
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :count, :max_cell_count)
  end
end
