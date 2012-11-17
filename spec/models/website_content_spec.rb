require 'spec_helper'

describe WebsiteContent do
  before do
  	@wc = WebsiteContent.new(:name => "test content", :contentlink => "http://google.com")
  end

  subject { @wc }

  it { should respond_to :name }
  it { should respond_to :contentlink }
  it { should be_valid }

end
