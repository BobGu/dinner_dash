require 'rails_helper'

RSpec.describe "order_items/new", :type => :view do
  before(:each) do
    assign(:order, Order.new(
      :user_id         => 1,
      :order_total     => 100.00,
      :order_type      => "Pickup",
      :delivery_address => "1510 Blake Street",
      :order_status    => "Paid"
    ))
  end

  xit "renders new order form" do
    render

      assert_select "form[action=?][method=?]", orders_path, "post" do

      assert_select "input#order_user_id[name=?]", "order[user_id]"

      assert_select "input#order_order_total[name=?]", "order[order_total]"

      assert_select "input#order_order_type[name=?]", "order[order_type]"

      assert_select "input#order_delivery_address[name=?]", "order[delivery_address]"

      assert_select "input#order_order_status[name=?]", "order[order_status]"
    end
  end
end
