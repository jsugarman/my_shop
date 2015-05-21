namespace :products do


	task :count => :environment do |args|

		count.times do

			FactoryGirl.create(:product)

		end

	end

end