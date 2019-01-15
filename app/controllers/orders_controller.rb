class OrdersController < ApplicationController
  before_action :authenticate_user!, :start_date_ealier_than_today?

  def new
    @order = Order.new
    @product = Product.find(params[:product_id])
  end

  def create
    @order = Order.new(user: current_user, product: product)
    if @order.save
      assign_ticket
    end
  end

  private

  def product
    Product.find(params[:product_id].to_i)
  end

  def assign_ticket
    Ticket.create(user: current_user, order: @order, start_date: Date.today, end_date: Date.today + product.days)
  end

  def activation_date
    return params["date_from"].to_date if params["date_from"].present?
    Date.today
  end

  def start_date_ealier_than_today?
    if params[:date_from].present? && params[:date_from].to_date < Date.today
      flash[:danger] = "Data aktywacji nie może być mniejsza od dzisiejszej."
      redirect_to request.referer
    end
  end
end
