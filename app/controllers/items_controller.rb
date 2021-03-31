class ItemsController < ApplicationController
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item =Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end

  private

    def item_params
      params.require(:item).permit(:name, :image, :price, :description, :shipping_cost_id, :prefecture_id,
      :days_to_ship_id, :items_status_id, :category_id).merge(user_id: current_user.id)
    end

  end
end
