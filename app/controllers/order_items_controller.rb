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

  def increment
    order_item   = OrderItem.find(params[:id])
    @order = Order.find(params[:order_id])
    @order.items << order_item.item
    redirect_to order_path(@order)
  end

  def decrement
    @order = Order.find(params[:order_id])
    order_item = @order.order_items.find(params[:id])
    order_item.delete if order_item
    redirect_to order_path(@order)
  end


end
