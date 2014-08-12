require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'the person view', type: :feature do 
	
	describe 'splash page' do
		it 'has splash page content' do
			visit '/'
			expect(page).to have_content("pie bitches")
		end
	end
end