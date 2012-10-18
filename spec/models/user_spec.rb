require 'spec_helper'

describe User do
  it "should relate own challenges" do
    octocat = FactoryGirl.create(:user)
    challenge = FactoryGirl.create(:challenge)

    octocat.challenges.first.should == challenge
  end
end
