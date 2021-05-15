class Schedule < ApplicationRecord
  belongs_to :user

  with_options presence: true do 
    validates :start_date, :ending_date, :content, :detail
  end
  validate :start_ending_check

  def start_ending_check
    errors.add(:ending_time, "は開始時間より遅い時間を選択してください。") if self.start_date > self.ending_date
  end
  
end
