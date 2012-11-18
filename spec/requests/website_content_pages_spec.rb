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

      describe "with invalid information" do

        before do
          fill_in "Name", with: "Test Lesson"
          fill_in "Contentlink", with: "www.google.com"
        end

        it "should not create a piece of web content" do
          expect { click_button submit }.to change(WebsiteContent, :count).by(0)
        end

        describe "error messages" do
          before { click_button submit }

          it { should have_selector('title', text: 'Create Web Content') }
          it { should have_content('error') }
        end

      end

  		describe "with valid information" do

  			before do
  				fill_in "Name", with: "Test Lesson"
          fill_in "Contentlink", with: "http://www.google.com"
  			end
 
  			it "should create a piece of web content" do
  				expect { click_button submit }.to change(WebsiteContent, :count).by(1)
  			end

        describe "after saving web content" do
          before { click_button submit }
          
          let(:website_content) { WebsiteContent.find_by_name('Test Lesson') }

          it { should have_selector('title', text: website_content.name) }
          it { should have_selector('div.alert.alert-success', text: 'Created Content: ' + website_content.name) }
          it { should have_selector('h1', text: website_content.name) }
          it { should have_selector('iframe') }

        end

  		end

  	end

  end

end