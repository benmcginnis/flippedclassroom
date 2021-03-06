class UsersController < ApplicationController
  before_filter :signed_in_user, 
                 only: [:index, :edit, :update, :destroy, :following, :followers, :show]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only: :destroy
  before_filter :authorized_viewer, only: :show

  def index

    if params[:section] && params[:section] != ""
      @users = User.where(:section => params[:section]).paginate(page: params[:page])

      @currentSection = 'Section ' + params[:section].to_s

      @selectedSection = params[:section]

    else
      @users = User.paginate(page: params[:page])

      @currentSection = "All Sections"

    end
  end

  def sections

    User.pluck(:section).uniq.collect { |s| ["Section " + s.to_s, s] }

  end

  helper_method :sections

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Flipped Classroom!"

      @msLucas = User.find_by_email("lucasma@pwcs.edu")

      @user.follow!(@msLucas)  unless @msLucas.nil?

      @msLucas.follow!(@user) unless @msLucas.nil?

      @mp = @user.microposts.build(:content => "Signed up for the Flipped Classroom!")

      @mp.save!

      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def authorized_viewer
      @user = User.find(params[:id])
      
      unless current_user?(@user) or current_user.admin?
        redirect_to current_user, notice: "You are not authorized to view this page."
      end
    end
end