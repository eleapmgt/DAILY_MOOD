class Diary < ApplicationRecord
  belongs_to :user
  has_many :diary_rewards, dependent: :destroy
  has_many :moods, dependent: :destroy
end
