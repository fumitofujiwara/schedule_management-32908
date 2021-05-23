FactoryBot.define do
  factory :schedule_comment do
    text {"テスト"}
    association :user
    association :schedule
  end
end
