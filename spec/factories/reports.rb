FactoryBot.define do
  factory :report do
    text {'イメージ'}
    association :user
    association :schedule

    after(:build) do |report|
      report.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
  end
end
