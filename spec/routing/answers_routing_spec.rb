require "spec_helper"

describe AnswersController do
  before(:each) do
  end

  describe "routing" do

    it "routes to #index" do
      get("/challenges/1/answers").should route_to("answers#index", :challenge_id => "1")
    end

    it "routes to #new" do
      get("/challenges/1/answers/new").should route_to("answers#new", :challenge_id => "1")
    end

    it "routes to #show" do
      get("/challenges/1/answers/1").should route_to("answers#show", :id => "1", :challenge_id => "1")
    end

    it "routes to #edit" do
      get("/challenges/1/answers/1/edit").should route_to("answers#edit", :id => "1", :challenge_id => "1")
    end

    it "routes to #create" do
      post("/challenges/1/answers").should route_to("answers#create", :challenge_id => "1")
    end

    it "routes to #update" do
      put("/challenges/1/answers/1").should route_to("answers#update", :id => "1", :challenge_id => "1")
    end

    it "routes to #destroy" do
      delete("/challenges/1/answers/1").should route_to("answers#destroy", :id => "1", :challenge_id => "1")
    end

  end
end
