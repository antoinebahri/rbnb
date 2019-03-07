class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :user
      t.references :flat
      t.date :start_date
      t.date :end_date
      t.integer :total_price
      t.string :status, default: "Request"

      t.timestamps
    end
  end
end
