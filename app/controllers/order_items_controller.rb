class OrderItemsController < ApplicationController
  def new
    @order = Order.find(params[:order_id])
    @order_item = OrderItem.new
  end

  def create
    
  end
end
