class AddNameToEquipments < ActiveRecord::Migration[5.2]
  def change
    add_column :equipment, :name, :string
  end
end
