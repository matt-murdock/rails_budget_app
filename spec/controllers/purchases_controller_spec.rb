require 'spec_helper'

describe PurchasesController do

  let(:purchase) do
    Purchase.find_or_create_by(:type => 'test purchase', :cost => 11.11, :date => Date.new(2014))
  end

  describe 'POST #create' do

    context 'valid post' do

      before :each do
        post :create, :purchase => { :type => 'TEST' , :sub_type => "Awesome", :cost => 111.11, :date => Date.new(2014) }
      end

      it 'redirects to the show action' do
        expect(response.body).to match 'redirected'
      end

      it 'saves the purchase to the database' do
        expect(Purchase.count).to eq 1
      end
    end

    context 'invalid post' do
      subject { post :create, :purchase => { :type => 'invalid'} }
      it 'renders new' do
        expect(subject).to render_template(:new)
      end
    end
  end

  describe 'GET #show' do
    it 'assigns the purchase' do
      get :show, :id => purchase.id
      expect(assigns(:purchase)).to eq(purchase)
    end
  end

  describe 'GET #index' do
    it 'assigns all puchases as @purchases' do
      purchase
      get :index
      expect(assigns(:purchases).count).to eq 1
    end
  end

  describe 'PUT #edit' do
    it 'assigns the purchase' do
      put :edit, :id => purchase.id
      expect(assigns(:purchase)).to eq(purchase)
    end
  end

  describe 'PUT #update' do
    context 'valid put' do
      before :each do
        put :update, :id => purchase.id, :purchase => { :type => 'updated'}
      end
      it 'assigns the purchase' do
        expect(assigns(:purchase)).to eq(purchase)
      end

      it 'redirects to the show action' do
       expect(response.body).to match 'redirected'
      end

      it 'updates the purchase' do
        expect(assigns[:purchase].type).to eq 'updated'
      end
    end
    context 'invalid post' do
      subject { put :update, :id => purchase.id, :purchase => { :type => ''} }
      it 'renders new' do
        expect(subject).to render_template(:edit)
      end
    end
  end

  describe '#destroy' do
    it 'assigns the purchase' do
      delete :destroy, {:id => purchase.id}
      expect(assigns(:purchase)).to eq(purchase)
    end
    it 'destroys the purchase' do
      expect_any_instance_of(Purchase).to receive(:destroy)
      delete :destroy, {:id => purchase.id}
    end
  end

end