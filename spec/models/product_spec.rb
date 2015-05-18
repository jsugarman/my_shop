require 'rails_helper'

RSpec.describe Product, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"


  describe 'validations' do
  	
  	# let(:subject){ Product.new('test','test product',1.00) } 
  	
  	before do
  		subject.valid?
  	end

  	it 'requires name to be present' do
  		expect(subject.errors[:name]).to include('can\'t be blank')
  	end
  	 
  	it 'requires description to be present' do
  		expect(subject.errors[:description]).to include('can\'t be blank')
  	end

  	it 'requires price to be present' do
  		expect(subject.errors[:name]).to include('can\'t be blank')
  	end

  end

end
