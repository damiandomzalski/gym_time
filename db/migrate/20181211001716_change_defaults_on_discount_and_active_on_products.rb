class ChangeDefaultsOnDiscountAndActiveOnProducts < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :discount, :boolean, default: false
    change_column :products, :active, :boolean, default: true
  end
end
