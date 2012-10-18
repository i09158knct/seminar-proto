require 'spec_helper'

describe Challenge do
  it "should relate own challenges" do
    octocat = FactoryGirl.create(:user)
    challenge = FactoryGirl.create(:challenge)

    challenge.user.should == octocat
  end
end