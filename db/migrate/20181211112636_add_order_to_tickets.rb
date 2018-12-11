class AddOrderToTickets < ActiveRecord::Migration[5.2]
  def change
    add_reference :tickets, :order, index: true 
  end
end
