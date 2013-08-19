# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :quote do
    quoter_id 1
    title "QuoterTitle"
    body "QuoterBody"
    publicated_at "2013-01-01 00:00:00"
  end
end
