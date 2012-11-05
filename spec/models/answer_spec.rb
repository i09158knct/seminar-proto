require 'spec_helper'

describe Answer do
  it "should return true when owner editing" do
    octocat = FactoryGirl.create(:user)
    answer = FactoryGirl.create(:answer)

    answer.user_can_edit?(octocat).should == true
  end
end
