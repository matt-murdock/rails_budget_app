class CreateFinancialPlans < ActiveRecord::Migration
  def change
    create_table :financial_plans do |t|
      t.string :name

      t.timestamps
    end
  end
end
