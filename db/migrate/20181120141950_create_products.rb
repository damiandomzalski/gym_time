class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.boolean :discount
      t.float :discount_size
      t.boolean :active

      t.timestamps
    end
  end
end
