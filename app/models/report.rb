class Report < ApplicationRecord
  belongs_to :schedule
  has_one_attached :image

  validates :text, presence: true
end
