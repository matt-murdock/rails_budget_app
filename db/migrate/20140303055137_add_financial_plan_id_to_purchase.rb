class AddFinancialPlanIdToPurchase < ActiveRecord::Migration
  def change
    add_column :purchases, :financial_plan, :integer
  end
end
