class UsersController < ApplicationController

    def displayall
        render json: User.all
    end

    def new
        render 'new'
    end

    def show 
        render json: User.where("id = ?", params[:id])
        
    end

    def edit
        @users = User.where("id = ?", params[:id])
        render 'edit'
    end

    def create
        User.create(user_params)
        redirect_to '/users'
    end

    def total
        render :text => "The total number of users is #{User.all.count}"
    
    end
private
    def user_params
        params.require(:user).permit(:name)
    end

end
