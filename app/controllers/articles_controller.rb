class ArticlesController < ApplicationController
def index
    @previewArticles = Article.all.select("id,title,publication_date,author,hero_image_filename,content_body").order("id desc")
    @articles = Article.order(publication_date: :desc).paginate(page: params[:mpage], :per_page => 3) 
    @articleResults = Article.all.select("id,title").order("id desc")
end
  
def new
    @articleResults = Article.all
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
    @articleResults = Article.all.select("id,title").order("id desc")
    redirect_to @article
      
end

def show
    @article = Article.find(params[:id])  
    @articleResults = Article.all.select("id,title").order("id desc")
end
   
def image_view_hero
    @article = Article.find(params[:id]) 
    send_data(@article.hero_image, :filename => @article.hero_image_filename, :type => @article.hero_image_contenttype, :disposition => "inline")
end

def image_view_optional
    @article = Article.find(params[:id]) 
    send_data(@article.optional_image, :filename => @article.optional_image_filename, :type => @article.optional_image_contenttype, :disposition => "inline")
end

def edit
    @article = Article.find(params[:id])
    @articleResults = Article.all.select("id,title").order("id desc")
end
    
def update
    @articleOld = Article.find(params[:id])
    @article =  Article.new(article_params)
    @article.publication_date = Time.zone.now
    if params[:article][:hero_image]
        @article.hero_image = params[:article][:hero_image].read
        @article.hero_image_filename = params[:article][:hero_image].original_filename
        @article.hero_image_contenttype = params[:article][:hero_image].content_type
    else
        @article.hero_image = @articleOld.hero_image
        @article.hero_image_filename =  @articleOld.hero_image_filename
        @article.hero_image_contenttype =  @articleOld.hero_image_contenttype
    end
    if params[:article][:optional_image]
       @article.optional_image = params[:article][:optional_image].read
       @article.optional_image_filename = params[:article][:optional_image].original_filename
       @article.optional_image_contenttype = params[:article][:optional_image].content_type
    else
       @article.optional_image = @articleOld.optional_image
       @article.optional_image_filename =  @articleOld.optional_image_filename
       @article.optional_image_contenttype =  @articleOld.optional_image_contenttype
    end
    @articleOld.destroy
    @article.save()
    @articleResults = Article.all.select("id,title").order("id desc")
    redirect_to @article
   end
   
def destroy
    @article = Article.find(params[:id])
    @article.destroy
    @articleResults = Article.all.select("id,title").order("id desc")
    redirect_to articles_path
  end
 
def pageResults
    @articleResults = Article.all.select("id,title").order("id desc")
    redirect_to articles_path
end

private
def article_params
    params.require(:article).permit(:title, :author, :category, :hero_image, :hero_image_filename, :hero_image_contenttype, :optional_image, :optional_image_filename, :optional_image_contenttype, :content_body)
end


end
