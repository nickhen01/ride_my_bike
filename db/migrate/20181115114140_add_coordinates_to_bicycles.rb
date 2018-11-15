class AddCoordinatesToBicycles < ActiveRecord::Migration[5.2]
  def change
    add_column :bicycles, :latitude, :float
    add_column :bicycles, :longitude, :float
  end
end
