class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :schedules
  has_many :schedule_comments
  has_many :reports
  
  with_options presence: true do
    validates :last_name, :first_name, :last_name_furigana, :first_name_furigana, :department, :position
  end
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\Z/ }
  VALID_NAME = /\A[ぁ-んァ-ヶ一-龥々ー]+\Z/
  validates :last_name, format: { with: VALID_NAME }
  validates :first_name, format: { with: VALID_NAME }
  VALID_NAME_FURIGANA = /\A[ァ-ヶー]+\Z/
  validates :last_name_furigana, format: { with: VALID_NAME_FURIGANA }
  validates :first_name_furigana, format: { with: VALID_NAME_FURIGANA }
  
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :department
  
    validates :department_id, numericality: { other_than: 1 }
end
