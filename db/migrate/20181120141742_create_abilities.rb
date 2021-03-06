class CreateAbilities < ActiveRecord::Migration[5.2]
  def change
    create_table :abilities do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.date :day
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
