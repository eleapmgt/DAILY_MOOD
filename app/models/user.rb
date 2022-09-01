class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :diaries, dependent: :destroy
  belongs_to :doctor, class_name: "User", foreign_key: :doctor_id, optional: true
  after_create :create_diary

  def create_diary
    Diary.create(user: self, date: Date.today)

    Mood.create(diary: diaries.last, principal: true)
    if diaries.present?
      rewards_used = []
      diaries.each do |diary|
        rewards_used << diary.diary_rewards.last.reward.id
      end
      rewards = Reward.where.not(id: rewards_used)
      DiaryReward.create(diary: diaries.last, reward: rewards.rand)
    else
      DiaryReward.create(diary: diaries.last, reward: Reward.all.rand)
    end

    # gratitude: "Aujourd'hui, j'ai de la gratitude pour..."

  end
end
