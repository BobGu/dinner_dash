require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'a admin viewing the items page', type: :feature do
  let(:user) do
    User.create!(:full_name   => "john doe",
                :email        => "john_doe@example.com",
                :display_name => "john_doe_123",
                :role         => "admin",
                :password     => 'password')
  end

  context "admin user functionality" do
    it 'can login with the correct information' do
      page.visit signin_path
      page.fill_in('session[email]',    with: user.email)
      page.fill_in('session[password]', with: 'password')
      page.click_button('Sign in')
      expect(page.current_url).to eq(admin_dashboard_url)
    end

    it 'can retire and item' do
      item = Item.create!(title: "Cami's", inventory: 12, price_pie: 30.99,
                          description: "yummy")

      page.visit signin_path
      page.fill_in('session[email]',    with: user.email)
      page.fill_in('session[password]', with: 'password')
      page.click_button('Sign in')
      page.click_link('Menu Item Management')
      expect(page).to have_content("yummy")
      page.click_link('Retire')
      expect(page).to_not have_content("yummy")
      # admin retires an item
      # that item is no longer viewed on menu
      # that item can not be ordered by users
    end

  end


end
