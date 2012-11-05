require 'spec_helper'

describe ManagementController do
  before(:each) do
    @current_user = FactoryGirl.create(:user)
    @request.session[:user_id] = @current_user.id
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

end
