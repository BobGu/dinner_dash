class OrdersController < ApplicationController
  before_action :set_order, only: [:show]
  def new
    @order = Order.new
  end

  def index
    @orders = Order.all
  end

  def show
  end

  def create
    @order = Order.new(order_params)
  end

  def update
  end

  def destroy
  end

  private
  def set_order
    @order = Order.find(params[:id])
  end
  def order_params
    params.require(:order).permit(:user_id, :order_total, :order_type, :deliver_address, :order_status)
  end
end
