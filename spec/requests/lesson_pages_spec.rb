require 'spec_helper'

describe "Lesson pages" do

  subject { page }

  describe "index" do

  	before do
      sign_in FactoryGirl.create(:user)
      FactoryGirl.create(:user, name: "Bob", email: "bob@example.com")
      visit lessons_path
    end

    it { should have_selector('title', text: 'Lessons') }
    it { should have_selector('h1', text: 'Lessons') }
    it { should have_link('New Lesson',  href: new_lesson_path)}

    describe "Listing" do
    	before(:all) { 30.times { FactoryGirl.create(:lesson) } }

    	it "should list each lessson" do
    		Lesson.all[0..2].each do |lesson| 
    			page.should have_selector('li', :content => lesson.name)
    		end
    	end

    end

  end

  describe "new" do
  	before { visit new_lesson_path }

  	it { should have_selector('title', text: 'Create New Lesson') }
  	it { should have_selector('h1', text: 'Create New Lesson') }

  	describe "create new lesson" do
  		before { visit new_lesson_path }

  		let(:submit) { "Create New Lesson" }

  		describe "with valid information" do

  			before do
  				fill_in "Name", with: "Test Lesson"
  			end
 
  			it "should create a lesson" do
  				expect { click_button submit }.to change(Lesson, :count).by(1)
  			end

  		end

  	end

  end

end