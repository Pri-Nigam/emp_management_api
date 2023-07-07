require 'faker'

FactoryBot.define do
  factory :designation do
    title { Faker::Job.title }
    description { Faker::Lorem.sentence }
    association :department
  end
end
