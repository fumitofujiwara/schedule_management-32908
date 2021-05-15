require 'rails_helper'

RSpec.describe Schedule, type: :model do
  before do
    @schedule = FactoryBot.build(:schedule)
  end

  describe 'スケジュール投稿' do
    it 'start_date,ending_date,content,detailが存在すれば投稿できる' do
      expect(@schedule).to be_valid
    end
  end
end
