class Recruitment < ApplicationRecord
  validates :title, presence: true
  validates :game_title, presence: true

  # has_many :comments
  belongs_to :user
  # belongs_to :favorite
end
