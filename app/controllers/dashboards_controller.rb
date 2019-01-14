class DashboardsController < ApplicationController
  before_action :authorize_admin

  def index
    @clients_count = User.where(role: [nil, ""], admin: false).count
    @orders = Order.all.limit(10).order(created_at: :desc)
    @orders_count = Order.count
    render layout: 'dashboard'
  end

  def new_product
    @product = Product.new
    render layout: 'dashboard'
  end

  def create_product
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "Produkt utworzony"
      redirect_to dashboards_path
    else
      flash[:danger] = "Nie można utworzyc karnetu: #{@product.errors.values.flatten.join(", ")}"
      redirect_to new_product_dashboards_path
    end
  end

  private

  def authorize_admin
    redirect_to root_path unless current_user.present? && current_user.admin?
  end

  def product_params
    params.require(:product).permit(:name, :price, :days, :description)
  end
end
