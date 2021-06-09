require 'rails_helper'

RSpec.describe Report, type: :model do
  before do
    @report = FactoryBot.build(:report)
  end

  describe 'レポート投稿機能' do
    context 'レポートが投稿できるとき' do
      it 'image,textが存在すると投稿できる' do
        expect(@report).to be_valid
      end
      it 'imageが空でも投稿できる' do
        @report.image = nil
        expect(@report).to be_valid
      end
    end
    context 'レポートが投稿できないとき' do
      it 'textが空だと投稿できない' do
        @report.text = nil
        @report.valid?
        expect(@report.errors.full_messages).to include "Text translation missing: ja.activerecord.errors.models.report.attributes.text.blank"
      end
      it 'userが紐づいていないと投稿できない' do
        @report.user = nil
        @report.valid?
        expect(@report.errors.full_messages).to include "User translation missing: ja.activerecord.errors.models.report.attributes.user.required"
      end
      it 'scheduleが紐づいていないと投稿できない' do
        @report.schedule = nil
        @report.valid?
        expect(@report.errors.full_messages).to include "Schedule translation missing: ja.activerecord.errors.models.report.attributes.schedule.required"
      end
    end
  end

end
