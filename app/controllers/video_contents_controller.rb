class VideoContentsController < ApplicationController

  before_filter :signed_in_user
  before_filter :admin_user, 
              only: [:destroy, :edit, :update, :new]

  def new

    @lesson = Lesson.find(params[:lesson_id])
  	@vc = VideoContent.new

  end

  def destroy
    ctd = VideoContent.find(params[:id])
    @lesson = Lesson.find(ctd.lesson_id)

    ctd.destroy

    flash[:success] = "Content deleted."
    redirect_to @lesson
  end

  def edit
    @vc = VideoContent.find(params[:id])
  end

  def update
    @vc = VideoContent.find(params[:id])

    if @vc.update_attributes(params[:video_content])
      flash[:success] = "Updated #{ @vc.name }"
      redirect_to @vc
    else
      render 'edit'
    end

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
