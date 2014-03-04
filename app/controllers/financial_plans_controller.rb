class FinancialPlansController < ApplicationController
  def index
    @financial_plans = FinancialPlan.all
  end

  def new
    @financial_plan = FinancialPlan.new
  end

  def create
    @financial_plan = FinancialPlan.new financial_plan_params
    @financial_plan.save ? (redirect_to @financial_plan) : (render 'new')
  end

  def show
    @financial_plan = FinancialPlan.find params[:id]
  end

  def edit
    @financial_plan = FinancialPlan.find params[:id]
  end

  def update
    @financial_plan = FinancialPlan.find params[:id]
    if @financial_plan.update params[:financial_plan].permit(:name)
      redirect_to @financial_plan
    else
      render 'edit'
    end
  end

  private
  def financial_plan_params
    params.require(:financial_plan).permit(:name)
  end
end
