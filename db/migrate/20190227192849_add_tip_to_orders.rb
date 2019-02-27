class AddTipToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :tip, :integer
  end
end
