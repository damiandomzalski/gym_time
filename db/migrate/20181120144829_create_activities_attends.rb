class CreateActivitiesAttends < ActiveRecord::Migration[5.2]
  def change
    create_table :activities_attends do |t|
      t.references :user, foreign_key: true
      t.references :activities, foreign_key: true

      t.timestamps
    end
  end
end
