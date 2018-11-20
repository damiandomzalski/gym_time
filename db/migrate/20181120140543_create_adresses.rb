class CreateAdresses < ActiveRecord::Migration[5.2]
  def change
    create_table :adresses do |t|
      t.string :name
      t.string :surname
      t.string :street
      t.string :zip_code
      t.string :city
      t.date :date_birth
      t.integer :pesel
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
