class Reward < ApplicationRecord
  has_many :diary_rewards, dependent: :destroy
end
