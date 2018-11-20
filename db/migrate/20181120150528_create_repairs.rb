class CreateRepairs < ActiveRecord::Migration[5.2]
  def change
    create_table :repairs do |t|
      t.date :fix_start_date
      t.date :fix_end_date
      t.integer :price
      t.references :equipment, foreign_key: true

      t.timestamps
    end
  end
end
