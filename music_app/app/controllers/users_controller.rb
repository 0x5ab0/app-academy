class UsersController < ApplicationController
    def show
        user = User.where(id: params[:id])
        render :json user.email
    end
end
