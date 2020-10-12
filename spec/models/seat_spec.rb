require 'rails_helper'

RSpec.describe Seat, type: :model do
  describe '#initialize' do
    context 'creating' do 
      let(:platinum_category) { Category.new(type: 'platinum', price: 320) }
      let(:seat) { Seat.new(seat_number: 'A1', status: 'available', category: platinum_category) }

      context 'when attributes are specified' do
        it 'instantiates the class with attributes arguments' do
          expect(seat).to be_an_instance_of(Seat)
        end

        it 'Set seat and category class associations' do
          expect(seat.category).to eq(platinum_category)
          expect(seat.show).to be_nil
        end
      end

      context 'when a attributes is not specified' do
        it 'should throw the argument error' do
          expect { Seat.new }.to raise_error(ArgumentError)
        end
      end
    end
  end
end
