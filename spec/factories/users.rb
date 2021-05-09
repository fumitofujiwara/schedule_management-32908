FactoryBot.define do
  factory :user do
    last_name             {'あーア'}
    first_name            {'あーア' }
    last_name_furigana    {'テスト'}
    first_name_furigana   {'テストー'}
    department_id         { 2 }
    position              { '係員' }
    email                 { Faker::Internet.free_email }
    password              { '1234qa'}
    password_confirmation { password }
  end
end
