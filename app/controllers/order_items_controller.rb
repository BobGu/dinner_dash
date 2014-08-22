class OrderItemsController < ApplicationController
  def new
    @order      = Order.find(params[:order_id])
    @order_item = OrderItem.new
  end

  def create
    item   = Item.find(params[:item_id])
    @order = Order.find(params[:order_id])
    @order.order_items.create(item)
    redirect_to items_path
  end
end
