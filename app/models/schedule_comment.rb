class ScheduleComment < ApplicationRecord
  belongs_to :user
  belongs_to :schedule
end
