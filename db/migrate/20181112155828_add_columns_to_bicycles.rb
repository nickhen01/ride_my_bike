class AddColumnsToBicycles < ActiveRecord::Migration[5.2]
  def change
    add_column :bicycles, :house_number, :string
    add_column :bicycles, :street, :string
    add_column :bicycles, :post_code, :string
    add_column :bicycles, :city, :string
    add_column :bicycles, :description, :text
    add_column :bicycles, :brand, :string
    add_column :bicycles, :model, :string
  end
end
