class UsersController < ApplicationController
    
    def new
      @user = User.new
    end
    
    def create
      
      @user = User.new(params_list) #now all the parameters have been white listed
      
      if @user.save
        flash[:success] = "Welcome to the Sample App!"
        redirect_to articles_path
      else
        render 'new' 
      end
      
    end
    
    
    def edit
    
      @user =User.find(params[:id])
     
    end
    

    # def update
    #   @user =User.find(parmas[:id])
     
    #  if @user.update(params_list)
    #   flash[:success]="User information edited successfully"
    #   redirect_to articles_path
    #  else
    #   render 'edit'
    # end
    
    
    
############################### WHITE LISTS ###########################################################################################
    private
    def params_list
        params.require(:user).permit(:username, :email, :password)
    end
    
end
