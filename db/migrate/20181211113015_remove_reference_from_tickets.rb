class RemoveReferenceFromTickets < ActiveRecord::Migration[5.2]
  def change
    remove_reference :tickets, :product, index: true, foreign_key: true
  end
end
