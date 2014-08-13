require 'rails_helper'

RSpec.describe "orders/index", :type => :view do
  before(:each) do
    assign(:orders, [
      Order.create!(
      :user_id         => 1
      :order_total     => 100.00
      :order_type      => "Pickup"
      :delivery_address => "1510 Blake Street"
      :order_status    => "Paid"
      ),
      Order.create!(
      :user_id         => 2
      :order_total     => 30.00
      :order_type      => "Delivery"
      :delivery_address => "1550 Market Street"
      :order_status    => "Unpaid"
      )
    ])
  end

  it "renders a list of orders" do
    render
    assert_select "li", :text => "Orders".to_s, :count => 1
  end
end
