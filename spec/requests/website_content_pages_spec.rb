require 'spec_helper'

describe "WebsiteContents pages" do

  subject { page }

  describe "new" do
  	before { visit new_website_content_path }

  	it { should have_selector('title', text: 'Create Web Content') }
  	it { should have_selector('h1', text: 'Create Web Content') }

  	describe "create new web content" do
  		before { visit new_website_content_path }

  		let(:submit) { "Add Content" }

  		describe "with valid information" do

  			before do
  				fill_in "Title", with: "Test Lesson"
          fill_in "Link", with: "www.google.com"
  			end
 
  			it "should create a lesson" do
  				expect { click_button submit }.to change(WebsiteContent, :count).by(1)
  			end

  		end

  	end

  end

end