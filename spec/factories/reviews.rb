# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :review do
    answer_id 1
    user_id 1
    gist_id 1
    gist_commit_id "MyString"
    targets "MyText"
    body "MyText"
  end
end
