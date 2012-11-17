class WebsiteContentsController < ApplicationController
  def new
  	@wc = WebsiteContent.new
  end

  def create
  	@wc = WebsiteContent.new(params[:websitecontent])
  	
  	if @wc.save
  		flash[:success] = "Created content: #{ @wc.name }"
    
    else
    	flash[:error] = "There was a problem"
  	end

  	render 'new'	
  
  end
  def show
  	@wc = WebsiteContent.find(params[:id])
  end
end
