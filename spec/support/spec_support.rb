module SpecSupport

	def valid_user
		FactoryGirl.create :user
	end

	def sign_in_user
		user = valid_user
		visit '/users/sign_in'
		fill_in 'Email', with: user.email
		fill_in 'Password', with: 'notasecret' #valid_user.password
		click_button 'Log in'
	end

end

RSpec.configure do |config| 
	config.include(SpecSupport, type: :feature)
end
