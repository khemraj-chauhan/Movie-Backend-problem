require 'rails_helper'
require 'report'

RSpec.describe Report do
  describe '#summery' do
    let(:total_revenue) do
      {
        revenue: 1520,
        service_tax: 212.8,
        swachh_bharat_cess: 7.6,
        krishi_kalyan_cess: 7.6
      }
    end

    context 'total revenue generated' do
      it 'fetch the total revenue details from sales and print' do
        expect(Sale).to receive(:total_sales_details).and_return(total_revenue)
        expect(STDOUT).to receive(:puts).with('Total Sales:')
        expect(STDOUT).to receive(:puts).with("Revenue: Rs. #{total_revenue[:revenue]}")
        expect(STDOUT).to receive(:puts).with("Service Tax: Rs. #{total_revenue[:service_tax]}")
        expect(STDOUT).to receive(:puts).with("Swachh Bharat Cess: Rs. #{total_revenue[:swachh_bharat_cess]}")
        expect(STDOUT).to receive(:puts).with("Krishi Kalyan Cess: Rs. #{total_revenue[:krishi_kalyan_cess]}\n\n")

        Report.summery
      end
    end
  end
end
