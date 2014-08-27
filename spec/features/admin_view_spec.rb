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
      page.visit signin_path
      page.fill_in('session[email]',    with: user.email)
      page.fill_in('session[password]', with: 'password')
      page.click_button('Sign in')
      save_and_open_page
      page.click_button('Menu Item Management')
      page.visit admin_items_path
      # admin retires an item
      # that item is no longer viewed on menu
      # that item can not be ordered by users
    end

  end


end
