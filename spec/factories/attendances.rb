FactoryBot.define do
  factory :attendance do
    sequence(:check_in) { |n| Time.now + n.minutes }
    sequence(:check_out) { |n| Time.now + (n + 1).minutes }
    employee
  end
end
