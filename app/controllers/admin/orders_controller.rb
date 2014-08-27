class Admin::OrdersController < ApplicationController
  before_action	:set_order,   only: [:show, :edit, :update, :destroy]
  before_action :authorize?,  only: [:index, :edit, :update, :destroy]

  def index
    @status_counts = Order.status_counts
    @all_count     = Order.all.count
    if params[:filter]
      @orders = Order.where(order_status: params[:filter])
    else
      @orders = Order.all
    end
  end

  def show
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

    def authorize?
      redirect_to "https://www.youtube.com/watch?v=Jvk7faxsxkQ" unless current_user.role == "admin"
    end
end
