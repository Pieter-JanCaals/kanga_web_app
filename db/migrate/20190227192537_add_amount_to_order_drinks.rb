class AddAmountToOrderDrinks < ActiveRecord::Migration[5.2]
  def change
    add_column :order_drinks, :amount, :integer
  end
end
