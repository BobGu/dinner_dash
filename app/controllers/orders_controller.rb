class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

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
end
