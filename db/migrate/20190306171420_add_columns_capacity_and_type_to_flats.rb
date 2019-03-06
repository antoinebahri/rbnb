class AddColumnsCapacityAndTypeToFlats < ActiveRecord::Migration[5.2]
  def change
    add_column :flats, :capacity, :integer
    add_column :flats, :type, :string
  end
end
