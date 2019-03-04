class AddUserToOrderDrinks < ActiveRecord::Migration[5.2]
  def change
    add_reference :order_drinks, :user, foreign_key: true
  end
end
