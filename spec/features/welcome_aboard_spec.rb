require 'rails_helper'

feature 'Welcome page' do

	# background do
	
	# end

	scenario "When visiting the home page the uer should see 'welcome aboard'" do
		visit '/'
		expect(page).to have_text("Welcome aboard")
	end

end
