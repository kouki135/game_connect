class Recruitment < ApplicationRecord
  validates :title, presence: true
  validates :game_title, presence: true

  # has_many :comments
  belongs_to :user
  # belongs_to :favorite

  def self.search(search)
    if search != ""
      Recruitment.where('game_title LIKE(?)', "%#{search}%")
    else
      Recruitment.order(updated_at: 'DESC')
    end
  end

end
