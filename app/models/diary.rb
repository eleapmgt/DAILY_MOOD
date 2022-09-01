class Diary < ApplicationRecord
  belongs_to :user

  has_many :diaries_rewards
  has_many :moods

  def mood_principal
    moods.where(principal: true).first if moods.present?
  end

  def mood_not_principal
    moods.where(principal: true).first if moods.present?
  end

  has_many :diary_rewards, dependent: :destroy
  has_many :moods, dependent: :destroy

  def mood_principal_rating
    moods.where(principal: true).first.rating
  end
end
