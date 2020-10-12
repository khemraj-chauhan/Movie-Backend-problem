require 'rails_helper'
require 'payment'

RSpec.describe Payment do
  describe '#seat_booking' do
    let(:platinum_category) { Category.new(type: 'platinum', price: 320) }
    let(:first_seat) { Seat.new(seat_number: 'A1', status: 'available', category: platinum_category) }
    let(:second_seat) { Seat.new(seat_number: 'A2', status: 'available', category: platinum_category) }
    let(:third_seat) { Seat.new(seat_number: 'A3', status: 'available', category: platinum_category) }
    let(:sales) do
      {
        subtotal: 640,
        service_tax: 89.6,
        swachh_bharat_cess: 3.2,
        krishi_kalyan_cess: 3.2,
        total: 736.0
      }
    end

    context 'when user select the seats and seats are available status' do
      it 'calculate the total, create sale record and update the seat status to sold' do
        audi = [1, 2, 3].sample
        bookable = [first_seat, second_seat]

        expect(STDOUT).to receive(:puts).with("Successfully Booked - Show #{audi}")
        expect(STDOUT).to receive(:puts).with("Subtotal: Rs. #{sales[:subtotal]}")
        expect(STDOUT).to receive(:puts).with("Service Tax @14%: Rs. #{sales[:service_tax]}")
        expect(STDOUT).to receive(:puts).with("Swachh Bharat Cess @0.5%: Rs. #{sales[:swachh_bharat_cess]}")
        expect(STDOUT).to receive(:puts).with("Krishi Kalyan Cess @0.5%: Rs. #{sales[:krishi_kalyan_cess]}")
        expect(STDOUT).to receive(:puts).with("Total: Rs. #{sales[:total]}\n\n")

        Payment.new(bookable).seat_booking(audi)

        expect(first_seat.status).to eq('sold')
        expect(second_seat.status).to eq('sold')
        expect(third_seat.status).to eq('available')
      end
    end
  end
end
