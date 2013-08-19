# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :quoter do
    name "QuoterName"
    rss_url "http://example.com"
  end
end
