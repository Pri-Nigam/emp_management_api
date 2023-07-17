FactoryBot.define do
  factory :task do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    status { Faker::Lorem.word }
    duedate { Faker::Date.forward(days: 7) }
  end
end
