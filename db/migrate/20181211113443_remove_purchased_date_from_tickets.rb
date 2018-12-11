class RemovePurchasedDateFromTickets < ActiveRecord::Migration[5.2]
  def change
    remove_column :tickets, :purchased_date, :date
  end
end
