class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.float :longitude
      t.float :latitude
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
