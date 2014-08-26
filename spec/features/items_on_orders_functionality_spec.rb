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
    page.visit orders_path

    click_on(order_item.id)

    expect(page).to have_content("Key Lime")
    expect(page).to have_content("Quantity: 1")
    expect(page).to have_content("Pie Price: ")
    expect(page).to have_content("Subtotal: ")
  end

  it "sees a '+' and '-' button next to quantity" do
    # viewing orders show page, see Item quantity
    order_item
    user
    page.visit orders_path

    click_on(order_item.id)

    # see and click a "+" or "-" button
    click_on("+")
    # expect that the "+" will increment the quantity by one
    expect(page).to have_content("Quantity: 2")
    # expect that the "-" will decrement the quantity by one
    click_on("-")
    expect(page).to have_content("Quantity: 1")
  end
end
