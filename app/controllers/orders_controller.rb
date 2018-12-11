class OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    @order = Order.create!(user: current_user, product: product)
    if @order
      assign_ticket
    end
  end

  def product
    Product.find(params[:product_id].to_i)
  end

  def assign_ticket
    Ticket.create!(user: current_user, order: @order, start_date: Date.today, end_date: Date.today + product.days)
  end
end
