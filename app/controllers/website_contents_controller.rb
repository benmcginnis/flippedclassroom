class WebsiteContentsController < ApplicationController

  before_filter :signed_in_user
  before_filter :admin_user, 
              only: [:destroy, :edit, :update, :new]

  def new

    @lesson = Lesson.find(params[:lesson_id])
  	@wc = WebsiteContent.new

  end

  def destroy
    ctd = WebsiteContent.find(params[:id])
    @lesson = Lesson.find(ctd.lesson_id)

    ctd.destroy

    flash[:success] = "Content deleted."
    redirect_to @lesson
  end

  def edit
    @wc = WebsiteContent.find(params[:id])
  end

  def update
    @wc = WebsiteContent.find(params[:id])

    if @wc.update_attributes(params[:website_content])
      flash[:success] = "Updated #{ @wc.name }"
      redirect_to @wc
    else
      render 'edit'
    end

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


    mp = current_user.microposts.build(:content => "Visited: #{ @wc.name }")

    mp.save!
  end

end
