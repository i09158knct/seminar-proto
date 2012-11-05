# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :answer do
    title "MyString"
    gist_id 1
    description "MyText"
    challenge_id 1
    user_id 1
  end
end
