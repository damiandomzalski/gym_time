class PagesController < ApplicationController
  def index
    @activities = Activity.all
    @products = Product.all
    render layout: false
  end
end
