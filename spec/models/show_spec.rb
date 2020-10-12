require 'rails_helper'

RSpec.describe Show, type: :model do
  describe '#initialize' do
    context 'creating' do 
      let(:platinum_category) { Category.new(type: 'platinum', price: 320) }
      let(:seat) { Seat.new(seat_number: 'A1', status: 'available', category: platinum_category) }
      let(:show) { Show.new([seat]) }

      context 'when a seats is specified' do
        it 'instantiates the class with seats arguments' do
          expect(show).to be_an_instance_of(Show)
        end

        it 'Set seat and show class associations' do
          expect(show.seats).to eq([seat])
        end
      end

      context 'when a seats is not specified' do
        it 'should throw the argument error' do
          expect { Show.new }.to raise_error(ArgumentError)
        end
      end
    end
  end
end
