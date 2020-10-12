require 'rails_helper'

RSpec.describe Sale, type: :model do
  let(:first_sale) do
    Sale.new(revenue: 560, service_tax: 78.40, swachh_bharat_cess: 2.80, krishi_kalyan_cess: 2.80)
  end
  let(:second_sale) do
    Sale.new(revenue: 960, service_tax: 134.40, swachh_bharat_cess: 4.80, krishi_kalyan_cess: 4.80)
  end

  describe '#initialize' do
    context 'creating' do
      context 'when attributes are specified' do
        it 'instantiates the class with attributes arguments' do
          expect(first_sale).to be_an_instance_of(Sale)
          expect(second_sale).to be_an_instance_of(Sale)
        end
      end

      context 'when a attributes is not specified' do
        it 'should throw the argument error' do
          expect { Sale.new }.to raise_error(ArgumentError)
        end
      end
    end
  end

  describe '#total_sales_details' do
    context 'Shows seats booked' do
      let(:expected_result) do
        {
          revenue: 1520,
          service_tax: 212.8,
          swachh_bharat_cess: 7.6,
          krishi_kalyan_cess: 7.6
        }
      end
      it 'share the final revenue to theatre owner' do
        Sale.class_variable_set :@@total_sales, []
        first_sale
        second_sale

        expect(Sale.total_sales_details).to eq(expected_result)
      end
    end
  end
end
