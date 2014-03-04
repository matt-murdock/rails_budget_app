require 'spec_helper'

describe Purchase do
  describe 'validation' do

    let(:purchase) do
      stub_model Purchase
    end

    before :each do
      purchase.valid?
    end

    it 'requires a type' do
      expect(purchase.errors[:type]).to include 'can\'t be blank'
    end

    it 'require a cost' do
      expect(purchase.errors[:cost]).to include 'can\'t be blank'
    end

    it 'requires a date' do
      expect(purchase.errors[:date]).to include 'can\'t be blank'
    end
  end

  describe 'relations' do
    it 'belongs to a financial plan' do
      expect(stub_model Purchase).to respond_to :financial_plan
    end
  end
end
