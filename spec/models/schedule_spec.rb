require 'rails_helper'

RSpec.describe Schedule, type: :model do
  before do
    @schedule = FactoryBot.build(:schedule)
  end

  describe 'スケジュール投稿' do
    it 'start_date,ending_date,content,detailが存在すれば投稿できる' do
      expect(@schedule).to be_valid
    end
    it 'start_dateよりending_dateの時間が後だと登録できる。' do
      @schedule.start_date = '2021-05-18 10:00:00'
      @schedule.ending_date = '2021-05-19 10:00:00'
      expect(@schedule).to be_valid
    end
    it 'contentが空の場合登録できない' do
      @schedule.content = ''
      @schedule.valid?
      expect(@schedule.errors.full_messages).to include "Content can't be blank"
    end
    it 'detailがからの場合登録できない' do
      @schedule.detail = ''
      @schedule.valid?
      expect(@schedule.errors.full_messages).to include "Detail can't be blank"
    end
    it 'start_dateよりending_dateの時間が早い時登録できない' do
      @schedule.start_date = '2021-05-16 10:00:00'
      @schedule.ending_date = '2021-05-15 10:00:00'
      @schedule.valid?
      expect(@schedule.errors.full_messages).to include "Ending date 終了時刻は開始時刻より遅い時間を選択してください。"
    end
    it 'start_dateよりending_dateの時間が同じ場合登録できない' do
      @schedule.start_date = '2021-05-15 10:00:00'
      @schedule.ending_date = '2021-05-15 10:00:00'
      @schedule.valid?
      expect(@schedule.errors.full_messages).to include "Ending date 終了時刻は開始時刻より遅い時間を選択してください。"
    end
  end
end
