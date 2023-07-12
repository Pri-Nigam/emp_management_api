FactoryBot.define do
  factory :leave do
    from_date { "2023-07-11" }
    to_date { "2023-07-11" }
    from_session { 1 }
    to_session { 1 }
    reason { "MyString" }
    mail_to { "MyString" }
    employee { nil }
  end
end
