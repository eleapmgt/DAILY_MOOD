class Diary < ApplicationRecord
  belongs_to :user
  has_many :diaries_rewards
  has_many :moods
end
