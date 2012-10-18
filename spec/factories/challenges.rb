# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :challenge do
    title "github challenge!"
    description "Regiter gist to this challenge."
    user_id 1
  end
end
