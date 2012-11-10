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

  end

end