require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe "user functionality related to items on order view", type: :feature do
  let(:keylime) { Item.create!(title: 'Key Lime', description: 'Yummy',  price_pie: 30.00) }

  let(:order) {Order.create!(user_id: 1, order_total: 60, order_type: "pick-up", order_status: "paid" )}
  let(:order_item) {OrderItem.create!(order_id: order.id, item_id: keylime.id)}
  let(:user) {User.create!(full_name: "Data", email: "sample@example.com", password: "password")}

  it "sees item with item name, quantity, price, and line-item subtotal" do
    order_item
    user
    #on orders index page
    page.visit orders_path

    #click on any order_id
    click_on(order_item.id)
    save_and_open_page
    #item has a name, quantity, price, and line-item subtotal
    expect(page).to have_content("Key Lime")
    expect(page).to have_content("Quantity: 1")
    expect(page).to have_content("Pie Price: ")
    expect(page).to have_content("Subtotal: ")
    #expect to see item attributes for an item in an order
  end
end
