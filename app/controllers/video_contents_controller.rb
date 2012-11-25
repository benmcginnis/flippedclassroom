class VideoContentsController < ApplicationController

  before_filter :signed_in_user
  before_filter :admin_user, 
              only: [:destroy, :edit, :update, :new]

  def new

    @lesson = Lesson.find(params[:lesson_id])
  	@vc = VideoContent.new

  end

  def create
    @temp = VideoContent.new(params[:video_content])
    @lesson = Lesson.find(@temp.lesson_id)
  	@vc  = @lesson.video_contents.build(params[:video_content])

  	if @vc .save
  		flash[:success] = "Created Content: #{ @vc.name }"
      redirect_to @vc
    
    else
      redirect_to new_video_content_path
  	end

  end
  def show
  	@vc = VideoContent.find(params[:id])
  end
  
end
