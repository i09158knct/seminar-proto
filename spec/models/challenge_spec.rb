require 'spec_helper'

describe Challenge do
  it "should return true when owner editing" do
    octocat = FactoryGirl.create(:user)
    challenge = FactoryGirl.create(:challenge)

    challenge.user_can_edit?(octocat).should == true
  end
end
