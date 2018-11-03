class CreateTickets < ActiveRecord::Migration[5.2]
  def self.up
    create_table :tickets do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.datetime :purchased_date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end

  def self.down
    drop_table :tickets
  end
end
