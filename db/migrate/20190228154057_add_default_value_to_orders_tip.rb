class AddDefaultValueToOrdersTip < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :tip, :integer, default: 15
  end
end
