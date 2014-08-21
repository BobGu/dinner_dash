require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'a admin viewing the items page', type: :feature do
  let(:user) do
    User.create!(:full_name => "john doe",
                :email => "john_doe@example.com",
                :display_name => "john_doe_123",
                :role => "admin",
                :password => 'password')
  end

  context "admin user functionality" do
    it 'can login with the correct information' do
      # visit the login page
      page.visit login_path
      # enter their information
      page.fill_in('email', :with => 'john_doe@example.com')
      page.fill_in('password', :with => 'password')
      page.click_button('Login')
      # then validate the email/password

      # see a validation that they have logged in
      page.has_content('Thanks for loggin in admin')
      #it should redirect them to the admin dashboard page
      expect(current_page).to eq(admin_path)
    end

    it 'can see a view that allows me to see item attributes on an order' do
      # a logged in admin sees the page of orders
      # 
    end

  end


end
