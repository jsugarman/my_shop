class Product < ActiveRecord::Base

	# validates :name, length: { maximum: 100}
	validates :name, presence: true, length: { maximum: 100}
	validates :description, presence: true, length: { maximum: 2000}
	validates :price, presence: true, numericality: { minimum: 0.01 ,greater_than: 0, less_than: 10000 }


end
