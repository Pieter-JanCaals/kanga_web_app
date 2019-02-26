class AddAddressToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :addres, :string
  end
end
