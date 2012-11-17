require 'spec_helper'

describe WebsiteContent do
  before do
  	@wc = WebsiteContent.new(:title => "test content", :link => "google.com")
  end

  subject { @wc }

  it { should respond_to :title }
  it { should respond_to :link }
  it { should be_valid }

end
