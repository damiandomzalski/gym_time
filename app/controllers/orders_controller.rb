class OrdersController < ApplicationController
  before_action :authenticate_user!

  def new
    @order = Order.new
    @product = Product.find(params[:product_id])
  end


  def create
    @order = Order.create!(user: current_user, product: product)
    if @order
      # binding.pry
      assign_ticket
    end
  end

  private

  def product
    Product.find(params[:product_id].to_i)
  end

  def assign_ticket
    Ticket.create!(user: current_user, order: @order, start_date: activation_date, end_date: activation_date + product.days)
  end

  def activation_date
    return params["date_from"].to_date if params["date_from"].present?
    Date.today
  end
end
