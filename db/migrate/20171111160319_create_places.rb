class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :title
      t.text :address
      t.float :longitude
      t.float :latitude
      t.string :visited_by

      t.timestamps
    end
  end
end
