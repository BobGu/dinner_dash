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
end
