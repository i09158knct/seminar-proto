require 'spec_helper'

describe "answers/show" do
  before(:each) do
    @answer = assign(:answer, stub_model(Answer,
      :title => "Title",
      :gist_id => 1,
      :file_names => "MyText",
      :description => "MyText",
      :challenge_id => 2,
      :user_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/1/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/2/)
    rendered.should match(/3/)
  end
end
