require 'rails_helper'

RSpec.describe "orders/edit", :type => :view do
  before(:each) do
    @order = assign(:order,
    Order.create!(
      :id               => 3,
      :user_id          => 1,
      :order_total      => 100.00,
      :order_type       => "Pickup",
      :delivery_address => "1510 Blake Street",
      :order_status    => "paid"
    ))
  end
end
