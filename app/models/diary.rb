class Diary < ApplicationRecord
  belongs_to :user
  has_many :diaries_rewards
  has_many :moods

  def mood_principal
    moods.where(principal: true).first if moods.present?
  end
end
