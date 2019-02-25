class CreateBarDrinks < ActiveRecord::Migration[5.2]
  def change
    create_table :bar_drinks do |t|
      t.references :drink, foreign_key: true
      t.references :bar, foreign_key: true

      t.timestamps
    end
  end
end
