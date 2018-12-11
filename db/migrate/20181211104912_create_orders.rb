class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :product
      t.references :user
      t.float :paid
      t.timestamps
    end
  end
end
