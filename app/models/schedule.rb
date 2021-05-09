class Schedule < ApplicationRecord
  belongs_to :user

  with_options presence: true do 
    validates :start_date, :ending_date, :content, :detail
  end
  
end
