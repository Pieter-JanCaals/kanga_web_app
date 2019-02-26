class AddPriceToDrinks < ActiveRecord::Migration[5.2]
  def change
    add_monetize :drinks, :price, currency: { present: false }
  end
end
