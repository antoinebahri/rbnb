class CreateFlats < ActiveRecord::Migration[5.2]
  def change
    create_table :flats do |t|
      t.string :address
      t.string :city
      t.integer :price_night
      t.string :description
      t.references :user
      t.string :picture

      t.timestamps
    end
  end
end
