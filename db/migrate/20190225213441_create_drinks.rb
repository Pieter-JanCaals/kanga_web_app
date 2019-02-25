class CreateDrinks < ActiveRecord::Migration[5.2]
  def change
    create_table :drinks do |t|
      t.string :name
      t.integer :prep_time
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
