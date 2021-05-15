class Schedule < ApplicationRecord
  belongs_to :user

  with_options presence: true do 
    validates :start_date, :ending_date, :content, :detail
  end
  validate :start_ending_check

  def start_ending_check
    errors.add(:ending_date, "終了時刻は開始時刻より遅い時間を選択してください。") if self.start_date > self.ending_date
  end
  
end
