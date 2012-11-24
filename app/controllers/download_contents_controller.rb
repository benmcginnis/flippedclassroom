class DownloadContentsController < ApplicationController
  def new

  	@lesson = Lesson.find(params[:lesson_id])
  	@dc = DownloadContent.new

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
