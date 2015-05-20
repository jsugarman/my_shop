require 'rails_helper'

feature "Products" do 

	# feature "#index" do
		
	# 	scenario "able to log in" do
	# 		visit '/products'
	# 		expect(page).to have_content("Log in")	
	# 	end

	# end

	feature "#new" do 

		background do
			sign_in_user
		end

		scenario 'create a new product' do

			visit '/products'
			expect(page).to have_text('Listing Products')

			click_link 'New Product'
			expect(page).to have_text('New Product')

			fill_in 'Name',with: "Nike T-Shirt"
			fill_in 'Description', with: "Men's T-Shirt in Red"
			fill_in 'Price', with: '15.00'

			click_button 'Create Product'
			expect(page).to have_text("Product was successfully created")

		end

		scenario 'fail to create a new product with invalid data' do

			visit '/products'
			expect(page).to have_text('Listing Products')

			click_link 'New Product'
			expect(page).to have_text('New Product')

			click_button 'Create Product'
			expect(page).to have_text(/\d+ errors? prohibited this product from being saved:/)

		end

	end

	feature "#edit" do

		background do
			sign_in_user
		end

		scenario 'edit a product successfully' do

			@product = FactoryGirl.create(:product)

			visit '/products'
			expect(page).to have_text('Listing Products')
			
	 		click_link 'Edit', href: "/products/#{@product.id}/edit"
			fill_in 'Price', with:'20.00'

			click_button 'Update Product'
			expect(page).to have_text("Product was successfully updated")

		end

		scenario 'delete a product successfully' do

			@product = FactoryGirl.create(:product)

			visit '/products'
			expect(page).to have_text('Listing Products')
			expect(page).to have_text("Nike T-Shirt")
			click_link 'Destroy', href: "/products/#{@product.id}"
			
			expect(page).to have_text("Product was successfully destroyed")

		end

	end

end