require 'spec_helper'

describe "answers/edit" do
  before(:each) do
    @answer = assign(:answer, stub_model(Answer,
      :title => "MyString",
      :gist_id => 1,
      :file_names => "MyText",
      :description => "MyText",
      :challenge_id => 1,
      :user_id => 1
    ))
  end

  it "renders the edit answer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => answers_path(@answer), :method => "post" do
      assert_select "input#answer_title", :name => "answer[title]"
      assert_select "input#answer_gist_id", :name => "answer[gist_id]"
      assert_select "textarea#answer_file_names", :name => "answer[file_names]"
      assert_select "textarea#answer_description", :name => "answer[description]"
      assert_select "input#answer_challenge_id", :name => "answer[challenge_id]"
      assert_select "input#answer_user_id", :name => "answer[user_id]"
    end
  end
end
