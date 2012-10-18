require 'spec_helper'

describe "challenges/new" do
  before(:each) do
    assign(:challenge, stub_model(Challenge,
      :title => "MyString",
      :description => "MyText",
      :user_id => 1
    ).as_new_record)
  end

  it "renders new challenge form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => challenges_path, :method => "post" do
      assert_select "input#challenge_title", :name => "challenge[title]"
      assert_select "textarea#challenge_description", :name => "challenge[description]"
      assert_select "input#challenge_user_id", :name => "challenge[user_id]"
    end
  end
end
