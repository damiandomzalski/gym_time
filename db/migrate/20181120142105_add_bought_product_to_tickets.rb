class AddBoughtProductToTickets < ActiveRecord::Migration[5.2]
  def change
    add_reference :tickets, :product
  end
end
