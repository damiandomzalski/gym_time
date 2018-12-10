class RenameProfileToRole < ActiveRecord::Migration[5.2]
  def change
      rename_column :users, :profile, :role
  end
end
