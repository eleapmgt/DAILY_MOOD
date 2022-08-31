class Diary < ApplicationRecord
  belongs_to :user

  has_many :diaries_rewards
  has_many :moods

  def mood_principal
    moods.where(principal: true).first if moods.present?
  end

  has_many :diary_rewards, dependent: :destroy
  has_many :moods, dependent: :destroy

end
