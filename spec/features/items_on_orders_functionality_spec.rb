require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe "user functionality related to items on order view", type: :feature do
  let(:keylime) { Item.create!(title: 'Key Lime', description: 'Yummy',  price_pie: 30.00) }

  let(:order) {Order.create!(user_id: 1, order_total: 60, order_type: "pick-up", order_status: "paid" )}
  let(:order_item) {OrderItem.create!(order_id: order.id, item_id: keylime.id)}
  let(:user) {User.create!(full_name: "Data", email: "sample@example.com", password: "password")}

end
