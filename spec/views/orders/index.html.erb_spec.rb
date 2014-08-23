require 'rails_helper'

RSpec.describe "orders/index", :type => :view do
  before(:each) do
    assign(:orders, [
      Order.create!(
      :user_id         => 1,
      :order_total     => 100.00,
      :order_type      => "Pickup",
      :delivery_address => "1510 Blake Street",
      :order_status    => "Paid"
      ),
      Order.create!(
      :user_id         => 1,
      :order_total     => 30.00,
      :order_type      => "Delivery",
      :delivery_address => "1550 Market Street",
      :order_status    => "Unpaid"
      )
    ])
    assign(:users, [
      User.create!(
      :id        => 1,
      :full_name => 'Harry Potter',
      :email     => 'harry@example.com',
      :role      => 'customer',
      :password  => 'password'
      )
    ])
  end

  it "renders a list of orders" do
    render
    assert_select "tr>th", :text => "Order ID:".to_s, :count => 1
    assert_select "tr>td", :text => "Edit".to_s, :count => 2
  end

  it "shows paid link"
end
