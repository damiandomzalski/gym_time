class UsersController < ApplicationController
    before_action :authenticate_user!
    
    def show 
        @user = User.find(params[:id])
        @orders = @user.orders.order(created_at: :desc)
    end


end
