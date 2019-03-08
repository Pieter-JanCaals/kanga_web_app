class CreateBestSellers < ActiveRecord::Migration[5.2]
  def change
    create_table :best_sellers do |t|
      t.integer :count
      t.references :drink, foreign_key: true
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
