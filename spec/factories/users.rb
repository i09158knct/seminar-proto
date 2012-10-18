FactoryGirl.define do
  factory :user do
    provider "github"
    uid "000000"
    name "octocat"
  end
end
