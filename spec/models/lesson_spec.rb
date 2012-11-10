require 'spec_helper'

describe Lesson do
  before do
  	@lesson = Lesson.new(:name => "test lesson")
  end

  subject { @lesson }

  it { should respond_to :name }
  it { should be_valid }

end
