require 'spec_helper'

describe FinancialPlan do
  describe 'relations' do
    it 'has many purchases' do
      expect(stub_model FinancialPlan).to respond_to :purchases
    end

    describe 'validation' do
      let(:plan) do
        stub_model FinancialPlan
      end

      it 'requires a name' do
        plan.valid?
        expect(plan.errors[:name]).to include 'can\'t be blank'
      end
    end
  end
end
