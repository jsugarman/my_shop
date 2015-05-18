# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)




# Product.find_or_create_by!(name: 'my product') do |p|
# 	 p.description = 'my product description'
# 	 p.price = '15.00'
# end

p = Product.find_by(name: "Nike T-Shirt")

if p.blank? 
	FactoryGirl.create(:product)
end
# p = FactoryGirl.create(:product); #unless !p.blank?
# if !Product.find_by(p)
# 	p = Product.create(p)
# 	p.save
# end 




