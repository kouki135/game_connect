class Recruitment < ApplicationRecord
  validates :recruitment, presence: true
  validates :game_title, presence: true
  validates :content, presence: true

  has_many :comments
  belongs_to :user
  belongs_to :favorite
end
