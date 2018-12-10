class RemoveNameAndSurnameFromAddress < ActiveRecord::Migration[5.2]
  def change

    remove_column :adresses, :name, :string
    remove_column :adresses, :surname, :string
  end
end
