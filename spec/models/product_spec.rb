require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'validations' do
  	
  	# let(:subject){ Product.new('test','test product',1.00) } 
  	
  	before do
  		subject.valid?
  	end

  	it 'record should NOT be valid' do
  		expect(subject.valid?).to eq(false)
  	end

  	
	describe "#name" do   	

	  	it 'must be present' do
	  		expect(subject.errors[:name]).to include('can\'t be blank')
	  	end

		it 'must be 100 or less characters' do
			subject.name = "a" * 101
			expect(subject.valid?).to eq(false)
	  		expect(subject.errors[:name]).to include('is too long (maximum is 100 characters)')
	  	end

  	end

	describe "#description" do 
		
		it 'must to be present' do
			expect(subject.errors[:description]).to include('can\'t be blank')
		end

		it 'must be 2000 characters or less' do
			subject.description = "a" * 2001
			expect(subject.valid?).to eq(false)
			# puts "errors: " + subject.errors[:description]
			# expect(subject.errors[:description]).to include('is too long (maximum is 100 characters)')
		end

	end

	describe "#price" do 

	  	it 'must be present' do
	  		expect(subject.errors[:price]).to include('can\'t be blank')
  		end

  		it 'must be a number' do
  			subject.price = 'foo'
  			expect(subject.valid?).to eq(false)
  			puts subject.errors[:price]
  			expect(subject.errors[:price]).to include('is not a number')
  		end

  		it 'must be greater than 0' do
  			subject.price = 0
  			expect(subject.valid?).to eq(false)
  			expect(subject.errors[:price]).to include('must be greater than 0')
  		end


  		it 'must be less than 10000' do
  			subject.price = 10000
  			expect(subject.valid?).to eq(false)
  			expect(subject.errors[:price]).to include('must be less than 10000')
  		end

  	end

  end

end
