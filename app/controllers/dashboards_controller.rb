class DashboardsController < ApplicationController
  before_action :authorize_admin
  layout 'dashboard'

  def index
    @clients_count = User.where(role: [nil, ""], admin: false).count
    @orders = Order.all.limit(10).order(created_at: :desc)
    @orders_count = Order.count
    @activities_count = Activity.count
  end

  def attach_trainer_to_activity
    binding.pry
    attachment = ActivitiesAttend.new(activities_id: params[:activity_id], user_id: current_user.id)
    if attachment.save
      flash[:success] = "Przypisano do zajęć!"
      redirect_to activities_dashboards_path
    else
      flash[:danger] = "Nie można przypisać do zajęć: #{attachment.errors.values.flatten.join(", ")}"
      redirect_to request.referer
    end
  end

  def activities
    @activities = Activity.all.order(created_at: :desc)
  end

  def edit_activity
    @activity = Activity.find(params[:id])
  end

  def update_activity
    @activity = Activity.find(params[:id])
    if @activity.update_attributes(activity_params)
      flash[:success] = "Zajęcia zaktualizowane"
      redirect_to activities_dashboards_path
    else
      flash[:danger] = "Nie można zaktualizować zajęć: #{@activity.errors.values.flatten.join(", ")}"
      redirect_to request.referer
    end
  end

  def products
    @products = Product.all.order(created_at: :desc)
  end

  def edit_product
    @product = Product.find(params[:id])
  end

  def update_product
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      flash[:success] = "Produkt zaktualizowany"
      redirect_to products_dashboards_path
    else
      flash[:danger] = "Nie można zaktualizować produktu: #{@product.errors.values.flatten.join(", ")}"
      redirect_to request.referer
    end
  end

  def new_product
    @product = Product.new
  end

  def create_product
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "Produkt utworzony"
      redirect_to products_dashboards_path
    else
      flash[:danger] = "Nie można utworzyc produktu: #{@product.errors.values.flatten.join(", ")}"
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

  def activity_params
    params.require(:activity).permit(:name, :number_seats, :description)
  end
end
