class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy, :cancel, :pay, :complete]

  def new
    @order = Order.new
  end

  def show
    @order
  end

  def create
    @order = Order.new(order_params)
    respond_to do |format|
      if @order.save!
        @cart.items.each do |item|
          @order.order_items.create!(item_id: item.id, order_id: @order.id)
        end
        cart_destroy
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
      else
        render :new
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
end
