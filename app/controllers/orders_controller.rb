class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy, :cancel, :pay, :complete]
  # before_action :default_params
  def new
    @order = Order.new
  end

  def index
    @status_counts = Order.status_counts
    @all_count = Order.all.count
    if params[:filter]
      @orders = Order.where(order_status: params[:filter])
    else
      @orders = Order.all
    end
  end

  def show
    @order
  end

  def create
    @order = Order.new(order_params)
    cart_destroy
    respond_to do |format|
      if @order.save!
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
    end
  end

  def cancel
    @order.order_status = "cancelled"
    @order.save
    redirect_to @order
  end

  def pay
    @order.order_status = "paid"
    @order.save
    redirect_to @order
  end

  def complete
    @order.order_status = 'completed'
    @order.save
    redirect_to @order
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:user_id,
                                  :order_total,
                                  :order_type,
                                  :delivery_address,
                                  :order_status
                                  )
  end

  # def default_params
  #   params[:user_id] ||= 1
  #   params[:order_type] ||= 'pickup'
  #   params[:delivery_address] ||= 'false'
  #   params[:order_status] ||= 'pending'
  # end
end
