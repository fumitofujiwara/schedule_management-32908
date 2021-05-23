require 'rails_helper'

RSpec.describe ScheduleComment, type: :model do
  before do
    @schedule_comment = FactoryBot.build(:schedule_comment)
  end
  describe 'スケジュールコメント投稿' do
    context 'コメントが投稿できるとき' do
      it 'textが存在すれば投稿できる' do
        expect(@schedule_comment).to be_valid
      end
    end
    context 'コメントが投稿できないとき' do
      it 'textがからの場合投稿できない' do
        @schedule_comment.text = nil
        @schedule_comment.valid?
        expect(@schedule_comment.errors.full_messages).to include "Text can't be blank"
      end
      it 'userが紐づいていないと投稿できない' do
        @schedule_comment.user = nil
        @schedule_comment.valid?
        expect(@schedule_comment.errors.full_messages).to include "User must exist"
      end
      it 'scheduleが紐づいていないと投稿できない' do
        @schedule_comment.schedule = nil
        @schedule_comment.valid?
        expect(@schedule_comment.errors.full_messages).to include "Schedule must exist"
      end
    end
  end

end
