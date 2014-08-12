require 'rails_helper'

RSpec.describe 'items/index', :type => :view do
  before(:each) do
    assign(:items, [
      Item.create!(
      :title => "Baltimore Bomb",
      :description => "Yay",
      :price_slice => 6.50,
      :price_pie => 30.00
      ),
    #   Item.create!(
    #   :title => "Key Lime",
    #   :description => "Yum",
    #   :price_slice => 7.00,
    #   :price_pie => 25.00
    #   )
    ])
  end

  it "renders a list of items" do
    pending
    render
    assert_select ".pie_title", :text => "Baltimore Bomb"
    assert_select ".pie_description", :text => "Yay"
    assert_select ".pie_price", :text => "6.50"
    # assert_select "li", :text => "Yay"
    # assert_select "li", :text => 7.00
  end

end
