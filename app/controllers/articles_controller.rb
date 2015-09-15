class ArticlesController < ApplicationController
    
    def index
        @articles = Article.paginate(page: params[:articles_page], :per_page => 5)
        @articles1 = Article.paginate(page: params[:articles1_page], :per_page => 3) 
    end
  
  def new
  end
  
  def create
 @article = Article.new(article_params)
 
  @article.save
  redirect_to @article
  end
  
 
  
  def show
    @article = Article.find(params[:id])
    @articles = Article.paginate(page: params[:page], :per_page => 5)    
      @articles1 = Article.paginate(page: params[:page], :per_page => 3)  
  end
   

  
   private
  def article_params
    params.require(:article).permit(:title, :author, :category, :hero_image, :optional_image, :content_body)
  end
end
