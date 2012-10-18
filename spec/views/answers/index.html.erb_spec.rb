require 'spec_helper'

describe "answers/index" do
  before(:each) do
    assign(:answers, [
      stub_model(Answer,
        :title => "Title",
        :gist_id => 1,
        :file_names => "MyText",
        :description => "MyText",
        :challenge_id => 2,
        :user_id => 3
      ),
      stub_model(Answer,
        :title => "Title",
        :gist_id => 1,
        :file_names => "MyText",
        :description => "MyText",
        :challenge_id => 2,
        :user_id => 3
      )
    ])
  end

  it "renders a list of answers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
