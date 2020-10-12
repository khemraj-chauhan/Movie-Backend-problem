require 'rails_helper'
require 'booking'
require 'payment'
require 'report'

RSpec.describe Booking do
  let(:show) {Audis.new.one}
  before do
    allow($stdout).to receive(:write)
  end

  describe '#display_show_details' do
    context 'Display Seating arrangement' do
      it 'show have seat categorization' do
        expect_any_instance_of(Booking).to receive(:selected_show).exactly(3).times
        expect_any_instance_of(Booking).to receive(:seat_categorization).exactly(3).times

        booking = Booking.new(show, show, show)
        booking.display_show_details
      end
    end
  end

  describe '#select_audi_and_seat' do
    context 'when show is invalid then set valid show which is sold out' do
      it 'should get error like show is not available' do
        booking = Booking.new(show, show, show)
        booking.stub(:gets).and_return("5\n", '1', 'B7')
        expect(STDOUT).to receive(:puts).with('Input:')
        expect(STDOUT).to receive(:puts).with('Please select valid audi number 1, 2, or 3')
        expect(STDOUT).to receive(:puts).with("B7 Not available, Please select different seats\n\n")

        booking.select_audi_and_seat
      end
    end

    context 'when show is invalid then set valid show which is sold out' do
      it 'should not get any error when show is available' do
        booking = Booking.new(show, show, show)
        booking.stub(:gets).and_return("5\n", '1', 'A1')
        expect(STDOUT).to receive(:puts).with('Input:')
        expect(STDOUT).to receive(:puts).with('Please select valid audi number 1, 2, or 3')
        expect_any_instance_of(Payment).to receive(:seat_booking).with(1)

        booking.select_audi_and_seat
      end
    end
  end

  describe '#sales_report' do
    context 'when shows seats sold out' do
      it 'generate the revenue summery report' do
        expect(Report).to receive(:summery)

        booking = Booking.new(show, show, show)
        booking.sales_report
      end
    end
  end
end
