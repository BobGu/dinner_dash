require 'rails_helper'

RSpec.describe 'items/index', :type => :view do
  before(:each) do
    assign(:items, [
      Item.create!(
      :title => "Baltimore Bomb",
      :description => "Yay",
      :price_pie => 30.00
      ),
      Item.create!(
      :title => "Key Lime",
      :description => "Yum",
      :price_pie => 25.00
      )
    ])
  end

  it "renders a list of items" do
    render
    assert_select ".pie_title", :text => "Baltimore Bomb"
    assert_select ".pie_title", :text => "Key Lime"
  end

end
