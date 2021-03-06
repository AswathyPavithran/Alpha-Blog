class ArticlesController < ApplicationController
	before_action :set_param, only: [:edit,:destroy,:update,:show]
  before_action :require_user, except: [:index,:show]
  before_action :require_same_user, only: [:edit,:update,:destroy]
  
def index
  @articles=Article.paginate(page: params[:page],per_page: 5)
end

def new
@article= Article.new
end

def edit

end

def create
  
    @article= Article.new(article_params)
    @article.user=current_user
    if  @article.save
      flash[:success]='Article is created successfully!'
      redirect_to article_path(@article)
    else
      render 'new'
  end
end
def update
  
  if @article.update(article_params)
  	flash[:success]="Updated successfully"
  	redirect_to article_path(@article)
  else
  	render 'edit'
  end
end

def show
 
end

def destroy
	
	@article.destroy
	flash[:danger]="Article is successfully deleted"
	redirect_to articles_path
end

private
  def set_param
  	@article=Article.find(params[:id])
  end

private
  def article_params
	params.require(:article).permit(:title, :description ,category_ids:[])
   end
end

private 
 def require_same_user
   if current_user != @article.user and !current_user.admin?
    flash[:danger]="You can only edit/delete your own article!"
    redirect_to root_path
  end

 end