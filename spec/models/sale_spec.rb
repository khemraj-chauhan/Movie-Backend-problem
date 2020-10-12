require 'rails_helper'

RSpec.describe Sale, type: :model do
  describe '#initialize' do
    context 'creating' do 
      let(:first_sale) do
        Sale.new(revenue: 560, service_tax: 78.40, swachh_bharat_cess: 2.80, krishi_kalyan_cess: 2.80)
      end
      let(:second_sale) do
        Sale.new(revenue: 960, service_tax: 134.40, swachh_bharat_cess: 4.80, krishi_kalyan_cess: 4.80)
      end

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
end
