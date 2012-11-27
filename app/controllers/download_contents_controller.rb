class DownloadContentsController < ApplicationController

  before_filter :signed_in_user
  before_filter :admin_user, 
              only: [:destroy, :edit, :update, :new]

  def new

  	@lesson = Lesson.find(params[:lesson_id])
  	@dc = DownloadContent.new

  end

  def destroy
    ctd = DownloadContent.find(params[:id])
    @lesson = Lesson.find(ctd.lesson_id)

    ctd.destroy

    flash[:success] = "Content deleted."
    redirect_to @lesson

  end

  def edit
    @dc = DownloadContent.find(params[:id])
  end

  def update
    @dc = DownloadContent.find(params[:id])

    if @dc.update_attributes(params[:download_content])
      flash[:success] = "Updated #{ @dc.name }"
      redirect_to @dc
    else
      render 'edit'
    end
  end

  def create
  	@temp = DownloadContent.new(params[:download_content])

  	@lesson = Lesson.find(@temp.lesson_id)

  	@dc = @lesson.download_contents.build(params[:download_content])

  	if @dc.save!
  		flash[:success] = "Created Content: #{ @dc.name }"
  		redirect_to @dc
  	else
  		redirect_to new_download_content_path
  	end

  end

  def show
  	@dc = DownloadContent.find(params[:id])
  end
  
end
