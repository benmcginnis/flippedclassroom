class WebsiteContentsController < ApplicationController
  def new
  	@wc = WebsiteContent.new
  end

  def create
  	@wc = WebsiteContent.new(params[:website_content])
  	
  	if @wc.save
  		flash[:success] = "Created Content: #{ @wc.name }"
      redirect_to @wc 
    
    else
      render "new"
  	end

  
  end
  def show
  	@wc = WebsiteContent.find(params[:id])
  end
end
