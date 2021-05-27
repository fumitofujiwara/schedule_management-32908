class Schedule < ApplicationRecord
  belongs_to :user
  has_many :schedule_comments, dependent: :destroy
  has_many :reports, dependent: :destroy 

  with_options presence: true do 
    validates :start_date, :ending_date, :content, :detail
  end
  validate :start_ending_check

  def start_ending_check
    if self.start_date >= self.ending_date
      errors.add(:ending_date, "終了時刻は開始時刻より遅い時間を選択してください。")
    end
  end
  
end
