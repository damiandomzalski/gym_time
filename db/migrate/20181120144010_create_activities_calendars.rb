class CreateActivitiesCalendars < ActiveRecord::Migration[5.2]
  def change
    create_table :activities_calendars do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.date :day
      t.references :user, foreign_key: true
      t.references :activities, foreign_key: true

      t.timestamps
    end
  end
end
