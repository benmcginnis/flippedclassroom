class LessonsController < ApplicationController
  before_filter :signed_in_user

  before_filter :admin_user, 
              only: [:destroy, :edit, :update, :new]

  def new
  	@lesson = Lesson.new
  end
  def index
    #@currentLesson = current_user.current_lesson
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

  def show

    @lesson = Lesson.find(params[:id])

  end

end
