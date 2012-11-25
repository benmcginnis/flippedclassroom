class WebsiteContentsController < ApplicationController

  before_filter :signed_in_user
  before_filter :check_admin, only: [:new, :create]

  def new

    @lesson = Lesson.find(params[:lesson_id])
  	@wc = WebsiteContent.new

  end

  def create
    @temp = WebsiteContent.new(params[:website_content])
    @lesson = Lesson.find(@temp.lesson_id)
  	@wc = @lesson.website_contents.build(params[:website_content])

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

  private 

    def check_admin
      admin_user(lessons_path)
    end
end
