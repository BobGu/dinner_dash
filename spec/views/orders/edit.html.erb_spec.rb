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

  it "renders the edit order form" do
    render
    expect(rendered).to match(/100.00/)

    # assert_select "form[action=?][method=?]", order_path(@order) , "post" do
    #   assert_select "input#order_user_id[name=?]", "order[user_id]"
    #   assert_select "input#order_order_total[name=?]", "order[order_total]"
    #   assert_select "input#order_order_type[name=?]", "order[order_type]"
    #   assert_select "input#order_delivery_address[name=?]", "order[delivery_address]"
    #   assert_select "input#order_order_status[name=?]", "order[order_status]"
    # end
  end
end
