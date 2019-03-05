class ChangeDescriptionTypeInFlats < ActiveRecord::Migration[5.2]
  def change
    change_column :flats, :description, :text
  end
end
