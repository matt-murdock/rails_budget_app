class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.string :type
      t.string :sub_type
      t.decimal :cost, :precision => 8, :scale => 2
      t.date :date

      t.timestamps
    end
  end
end
