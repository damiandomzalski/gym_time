class AddDaysToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :days, :integer
  end
end
