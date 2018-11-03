class AddAdminFlagOnUser < ActiveRecord::Migration[5.2]
  def self.up
    add_column :users, :admin, :boolean, default: false
  end

  def self.down
    remove_column :user, :admin
  end
end
