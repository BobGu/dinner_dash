require 'rails_helper'

RSpec.describe "orders/show", :type => :view do
  before(:each) do
    @order = assign(:order, Order.create!(
      :user_id         => 1,
      :order_total     => 100.00,
      :order_type      => "Pickup",
      :delivery_address => "1510 Blake Street",
      :order_status    => "Paid"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Order Total/)
  end
end
