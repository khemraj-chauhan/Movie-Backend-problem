require 'rails_helper'

RSpec.describe Category, type: :model do
  describe '#initialize' do
    context 'creating' do 
      let(:platinum_category) { Category.new(type: 'platinum', price: 320) }

      context 'when attributes are specified' do
        it 'instantiates the class with attributes arguments' do
          expect(platinum_category).to be_an_instance_of(Category)
          expect(platinum_category.seat).to be_nil
        end
      end

      context 'when a attributes is not specified' do
        it 'should throw the argument error' do
          expect { Category.new }.to raise_error(ArgumentError)
        end
      end
    end
  end
end
