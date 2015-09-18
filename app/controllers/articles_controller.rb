class ArticlesController < ApplicationController
    
    def index
        @topArticle = Article.all
        @articles = Article.order(publication_date: :desc).paginate(page: params[:mpage], :per_page => 3)
        @articles1 = Article.order(publication_date: :desc).paginate(page: params[:fpage], :per_page => 4) 
    end
  
  def new
        @articles1 = Article.paginate(page: params[:fpage], :per_page => 4) 
  end
  
  def create

@article = Article.new(article_params)
@article.publication_date = Time.zone.now

      if params[:article][:hero_image]
        @article.hero_image = params[:article][:hero_image].read
        @article.hero_image_filename = params[:article][:hero_image].original_filename
        @article.hero_image_contenttype = params[:article][:hero_image].content_type
      end
      
      if params[:article][:optional_image]
           @article.optional_image = params[:article][:optional_image].read
                   @article.optional_image_filename = params[:article][:optional_image].original_filename
        @article.optional_image_contenttype = params[:article][:optional_image].content_type
      end
@article.save()

      redirect_to @article
      
  end
  
 
  
  def show
    
    @article = Article.find(params[:id])  
 @articles = Article.paginate(page: params[:mpage], :per_page => 3)
        @articles1 = Article.paginate(page: params[:fpage], :per_page => 4) 
  end
   
def image_view_hero

@article = Article.find(params[:id]) 
    
 send_data(@article.hero_image,
 :filename => @article.hero_image_filename,
 :type => @article.hero_image_contenttype,
 :disposition => "inline")
end

def image_view_optional

@article = Article.find(params[:id]) 
    
 send_data(@article.optional_image,
 :filename => @article.optional_image_filename,
 :type => @article.optional_image_contenttype,
 :disposition => "inline")
end

  def edit
    @article = Article.find(params[:id])
            @articles = Article.order(publication_date: :desc).paginate(page: params[:mpage], :per_page => 3)
        @articles1 = Article.paginate(page: params[:fpage], :per_page => 4)
  end
    
    def update
       @article = Article.find(params[:id])
 
      if @article.update(article_params)
        redirect_to @article
      else
         redirect_to @article
      end
   end
   
def destroy
    @article = Article.find(params[:id])
    @article.destroy
 
    redirect_to articles_path
  end
 
   private
  def article_params
    params.require(:article).permit(:title, :author, :category, :hero_image, :filename, :content_type, :optional_image, :content_body)
  end


end
