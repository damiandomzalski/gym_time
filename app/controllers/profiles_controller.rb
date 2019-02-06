class ProfilesController < ApplicationController
    before_action :authenticate_user!

attr_accessor :image_file_name
    def show
        @user = User.find(params[:id])
        @orders = @user.orders.order(created_at: :desc)
    end

    def update
        @user = User.find(params[:id])
        if @user.update_attributes(params.slice(:image))
          redirect_to profile_path(current_user)
        end
    end

    private

    def user_params
        params.require(:user).permit(:image)
    end

end
