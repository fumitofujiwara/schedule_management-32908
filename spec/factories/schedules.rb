FactoryBot.define do
  factory :schedule do
    start_date  {Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default) }
    ending_date {Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default) }
    content     { 'テスト勉強' }
    detail      { 'プログラミングを頑張る'}
  end
end
