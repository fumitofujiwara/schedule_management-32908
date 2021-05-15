FactoryBot.define do
  factory :schedule do
    start_date  { '2021-05-16 10:00:00'}
    ending_date { '2021-05-16 11:00:00' }
    content     { 'テスト勉強' }
    detail      { 'プログラミングを頑張る'}
    association :user
  end
end
