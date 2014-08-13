require 'rails_helper'

RSpec.describe "orders/new", :type => :view do
  before(:each) do
    assign(:order, Order.new(
      :user_id         => 1
      :order_total     => 100.00
      :order_type      => "Pickup"
      :deliver_address => "1510 Blake Street"
      :order_status    => "Paid"
    ))
  end

  it "renders new order form" do
    render

      assert_select "form[action=?][method=?]", order_path(@order), "post" do

      assert_select "input#order_user_id[user_id=?]", "order[user_id]"

      assert_select "input#order_order_total[order_total=?]", "order[order_total]"

      assert_select "input#order_order_type[order_type=?]", "order[order_type]"

      assert_select "input#order_deliver_address[deliver_address=?]", "order[deliver_address]"

      assert_select "input#order_order_status[order_status]", "order[order_status]"
    end
  end
end
