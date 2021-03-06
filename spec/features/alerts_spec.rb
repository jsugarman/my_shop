require 'rails_helper'

feature 'Alerts' do

	background do
		sign_in_user
	end
	
	scenario "notice flash messages should be dismissible", js: true do

		visit '/products/new'

		fill_in 'Name', with: "Nike T-Shirt"
		fill_in 'Description', with: "Men's T-Shirt in Red"
		fill_in 'Price', with: '15.00'

		click_button 'Create Product'
		expect(page).to have_text("Product was successfully created")

		within '.alert-success' do
			click_button 'Close'
		end

		expect(page).not_to have_text("Product was successfully created" )

	end

	scenario "alert flash messages should be dismissible", js: true do

		visit '/products/new'
		
		fill_in 'Name', with: "Nike T-Shirt"
		fill_in 'Description', with: "Men's T-Shirt in Red"
		fill_in 'Price', with: '-1'

		click_button 'Create Product'
		expect(page).to have_text("Failed to create product - please check for errors")

		within '.alert-danger' do
			click_button 'Close'
		end

		expect(page).not_to have_text("Failed to create product - please check for errors")

	end

end