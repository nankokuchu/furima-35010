class OrdersController < ApplicationController
  def new
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
      if user_signed_in? && current_user.id == @item.user_id || @item.order.present?
        redirect_to root_path
      end
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      Payjp.api_key = "sk_test_4e23f07dc422ee61c3e1f50a"
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
      @order_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end
end
