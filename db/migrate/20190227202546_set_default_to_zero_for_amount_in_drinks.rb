class SetDefaultToZeroForAmountInDrinks < ActiveRecord::Migration[5.2]
  def change
    change_column :order_drinks, :amount, :integer, default: 0
  end
end
