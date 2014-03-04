class PurchasesController < ApplicationController
  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new purchase_params
    @purchase.save ? (redirect_to @purchase) : (render 'new')
  end

  def show
    @purchase = Purchase.find(params[:id])
  end

  def index
    @purchases = Purchase.all
  end

  def edit
    @purchase = Purchase.find(params[:id])
  end

  def update
    @purchase = Purchase.find(params[:id])
    if @purchase.update(params[:purchase].permit(:type, :sub_type, :cost, :date))
      redirect_to @purchase
    else
      render 'edit'
    end
  end

  def destroy
    @purchase = Purchase.find(params[:id])
    @purchase.destroy
    redirect_to purchases_path
  end

  private
  def purchase_params
    params.require(:purchase).permit(:type, :sub_type, :cost, :date)
  end
end
