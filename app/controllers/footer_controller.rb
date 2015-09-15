class FooterController < ApplicationController
  def index
      @articles1 = Article.paginate(page: params[:page], :per_page => 3) 
  end
  
  def new
  end
  
  def show
    @article = Article.find(params[:id])
    @articles1 = Article.paginate(page: params[:page], :per_page => 3)  
  end
end
