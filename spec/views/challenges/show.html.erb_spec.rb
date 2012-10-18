require 'spec_helper'

describe "challenges/show" do
  before(:each) do
    @challenge = assign(:challenge, stub_model(Challenge,
      :title => "Title",
      :description => "MyText",
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
    rendered.should match(/1/)
  end
end
