FactoryBot.define do
  factory :attendance do
    check_in { "2023-07-10 15:41:02" }
    check_out { "2023-07-10 15:41:02" }
    employee { nil }
  end
end
