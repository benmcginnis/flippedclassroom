class LessonsController < ApplicationController
  def new
  	@lesson = Lesson.new
  end
  def index
  	@lessons = Lesson.all
  end

  def create
    @lesson = Lesson.new(params[:lesson])
    if @lesson.save
      flash[:success] = "Created #{ @lesson.name }"
      redirect_to lessons_path
    else
      render 'new'
    end
  end
end
