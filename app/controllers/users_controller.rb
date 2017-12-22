class UsersController < ApplicationController

  ################## Reduce redundancy from  edit, update and show method ########
  #
    before_action :user_object ,only:[:edit ,:update ,:delete]
  #
  # ##################### Defining User_Object ###################################
  #
    def user_object
      @user =User.find(params[:id])
    end
  ################################################################################

    def index
      @users = User.all
    end

    def new
      @user = User.new
    end
    
    def create
      
      @user = User.new(params_list) #now all the parameters have been white listed
      
      if @user.save

        flash[:success] = "Welcome to the Sample App!"
        redirect_to login_path
      else
        render 'new' 
      end
      
    end
    
    def edit
    
      # @user =User.find(params[:id])
     
    end
    

    def update
      # @user =User.find(params[:id])
     
      if @user.update(params_list)
      flash[:success]="User information edited successfully"
      redirect_to user_path(@user)
      else
      render 'edit'
      end
    end
    
    def show 
      # @user = User.find(params[:id]) #this will find the article recently created with id  and pass it show via article object
    end
    
    
############################### WHITE LISTS ##########################################
    private
    def params_list
        params.require(:user).permit(:username, :email, :password)
    end
    
end
