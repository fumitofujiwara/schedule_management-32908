FactoryBot.define do
  factory :schedule_comment do
    text {"ใในใ"}
    association :user
    association :schedule
  end
end
