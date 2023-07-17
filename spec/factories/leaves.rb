FactoryBot.define do
  factory :leave do
    from_date { Faker::Date.backward(days: 30) }
    to_date { Faker::Date.forward(days: 30) }
    from_session { Faker::Number.between(from: 1, to: 2) }
    to_session { Faker::Number.between(from: 1, to: 2) }
    reason { Faker::Lorem.sentence }
    mail_to { Faker::Internet.email }
    leave_type { Leave.leave_types.keys.sample }
    status { Leave.statuses.keys.sample }
    association :employee
  end
end
