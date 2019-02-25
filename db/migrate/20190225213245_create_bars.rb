class CreateBars < ActiveRecord::Migration[5.2]
  def change
    create_table :bars do |t|
      t.string :name
      t.float :longitude
      t.float :latitude
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
