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
    expect(rendered).to match(/Baltimore Bomb/)
    expect(rendered).to match(/Yay/)
    expect(rendered).to match(/Key Lime/)
    expect(rendered).to match(/Yum/)
  end

end
