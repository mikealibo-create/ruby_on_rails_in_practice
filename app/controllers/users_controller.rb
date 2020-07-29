class UsersController < ApplicationController
    # show the user
    def show
        @user = User.find(params[:id])
    end

    # display list of users
    def index
        @users = User.all
    end

    # return the form for creating new user
    def new
        @user = User.new
    end

    # return the edit form
    def edit
        @user = User.find(params[:id])
    end

    # add data to the database
    def create
        @user = User.new(user_params)
        
        if @user.save
            redirect_to @user
        else
            render 'new'
        end
    end

    # update the edited data
    def update

        @user = User.find(params[:id])

        if @user.update(user_params)
            redirect_to @user
        else
            render 'edit'
        end
    end

    # delete the user
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        
        redirect_to users_path
    end
    
    private
        def user_params
            params.require(:user).permit(:first_name, :last_name, :email, :user)
        end

end