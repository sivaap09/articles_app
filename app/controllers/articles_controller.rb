class ArticlesController < ApplicationController
    
    def index
        @articles = Article.order(publication_date: :desc).paginate(page: params[:mpage], :per_page => 5)
        @articles1 = Article.paginate(page: params[:fpage], :per_page => 3) 
    end
  
  def new
        @articles1 = Article.paginate(page: params[:fpage], :per_page => 3) 
  end
  
  def create

@article = Article.new(article_params)
@article.publication_date = Time.zone.now

      if params[:article][:hero_image]
        @article.hero_image = params[:article][:hero_image].read
        @article.filename = params[:article][:hero_image].original_filename
        @article.content_type = params[:article][:hero_image].content_type
      end
@article.save()

      redirect_to @article
      
  end
  
 
  
  def show
    
    @article = Article.find(params[:id])  
 @articles = Article.paginate(page: params[:mpage], :per_page => 5)
        @articles1 = Article.paginate(page: params[:fpage], :per_page => 3) 
  end
   
def image_view

@article = Article.find(params[:id]) 
    
 send_data(@article.hero_image,
 :filename => @article.filename,
 :type => @article.content_type,
 :disposition => "inline")
end




 
   private
  def article_params
    params.require(:article).permit(:title, :author, :category, :hero_image, :filename, :content_type, :content_body)
  end


end
