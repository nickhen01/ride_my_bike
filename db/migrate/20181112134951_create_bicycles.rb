class CreateBicycles < ActiveRecord::Migration[5.2]
  def change
    create_table :bicycles do |t|
      t.integer :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
