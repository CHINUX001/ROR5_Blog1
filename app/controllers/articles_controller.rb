class ArticlesController < ApplicationController


    
    def index
      @articles = Article.all
    end
    
    def new
       @article = Article.new 
    end
    def create
        # render plain: params[:article].inspect
    
        @article = Article.new(params_list) #it cretes at article object with parameter passed from parameterlist method
        @article.user_id = current_user.id
        if @article.save
          flash[:notice] ="Article created sucessfully"
          redirect_to article_path(@article) #it passes the created  object to show path of the article
        else
            render "new"
        end
        
        # redirect_to article_path(@article) 
    end
    
   
    def show 
      @article = Article.find(params[:id]) #this will find the article recently created with id  and pass it show via article object 
    end
    
    def edit
      @article = Article.find(params[:id])
    end
    
    def update
      @article= Article.find(params[:id])
      if @article.update(params_list)   #when updating the database first whitelist those items
        flash[:notice] ="Article edited sucessfully"
        redirect_to article_path(@article) #it passes the created  parameter
      else
        render "edit"
      end
    end
    
    def destroy
      @article = Article.find(params[:id])
      @article.destroy
      redirect_to articles_path
    end
    
    
    
############################### WHITE LISTS ###########################################################################################
    private
    def params_list
        params.require(:article).permit(:title, :description)
    end



end  #END OF THE CLASS 
