require 'spec_helper'

describe User do
  before(:each) do
    @octocat = FactoryGirl.create(:user)
    @challenge = FactoryGirl.create(:challenge)
    @answer = FactoryGirl.create(:answer)
  end

  it "should relate own challenges" do
    @octocat.challenges.first.should == @challenge
  end

  it "should relate own answers" do
    @octocat.answers.first.should == @answer
  end
end
