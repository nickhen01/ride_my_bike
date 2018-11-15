class AddAreaToBicycles < ActiveRecord::Migration[5.2]
  def change
    add_column :bicycles, :area, :string
  end
end
