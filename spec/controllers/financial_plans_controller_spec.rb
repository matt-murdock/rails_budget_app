require 'spec_helper'

describe FinancialPlansController do
  let(:plan) do
    FinancialPlan.find_or_create_by(:name => 'the name')
  end
  describe 'GET #index' do
    it 'assigns all financial plans as @financial_plans' do
      plan
      get :index
      expect(assigns[:financial_plans].count).to eq 1
    end
  end

  describe '#new' do
    it 'assigns @financial_plan as a FinancialPlan' do
      get :new
      expect(assigns[:financial_plan]).to be_an_instance_of(FinancialPlan)
    end
  end

  describe 'POST #create' do
    context 'valid post' do
      before :each do
        post :create, :financial_plan => { :name => 'param_test_plan'}
      end
      it 'creates a new financial_plan with the parameters' do
        expect(assigns[:financial_plan].name).to eq 'param_test_plan'
      end

      it 'redirects to the show action' do
        expect(response.body).to match 'redirected'
      end
    end

    context 'invalid post' do
      subject { post :create, :financial_plan => {:foo => 'bar'}}
      it 'renders new' do
        expect(subject).to render_template(:new)
      end
    end
  end

  describe 'GET #show' do
    it 'assigns the financial_plan with the id' do
      get :show, :id => plan.id
      expect(assigns(:financial_plan)).to eq plan
    end
  end

  describe 'PUT #edit' do
    it 'assigns the financial_plan' do
      put :edit, :id => plan.id
      expect(assigns(:financial_plan)).to eq plan
    end
  end

  describe 'PUT #update' do
    context 'valid put' do
      before :each do
        put :update, :id => plan.id, :financial_plan => { :name => 'updated'}
      end

      it 'assigns the financial_plan' do
        expect(assigns(:financial_plan)).to eq plan
      end

      it 'redirects to the show action' do
        expect(response.body).to match 'redirected'
      end

      it 'updates the purchase' do
        expect(assigns[:financial_plan].name).to eq 'updated'
      end
    end
    context 'invalid post' do
      subject { put :update, :id => plan.id, :financial_plan => { :name => nil } }
      it 'renders new' do
        expect(subject).to render_template(:edit)
      end
    end
  end

  describe '#destroy' do
    it 'assigns the financial_plan' do
      delete :destroy, { :id => plan.id }
      expect(assigns(:destroy)).to eq plan
    end
  end
end
