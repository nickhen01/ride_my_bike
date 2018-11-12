class AddPhotoToBicycles < ActiveRecord::Migration[5.2]
  def change
    add_column :bicycles, :photo, :string
  end
end
