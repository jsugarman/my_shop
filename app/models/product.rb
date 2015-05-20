class Product < ActiveRecord::Base

	has_and_belongs_to_many :categories

	# validates :name, length: { maximum: 100}
	validates :name, presence: true, length: { maximum: 100}
	validates :description, presence: true, length: { maximum: 2000}
	validates :price, presence: true, numericality: { minimum: 0.01 ,greater_than: 0, less_than: 10000 }
	validates :color, length: { maximum: 30 }


	alias_attribute :colour, :color

	# alternative - but requires workaround
	# define_attribute_methods #preempt lazy attribute definition
	# alias_method :colour, :color 

	default_scope { order(arel_table[:created_at].desc) }
	scope :color, ->(color) { where(color: color) }

end
