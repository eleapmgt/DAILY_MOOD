class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :diaries, dependent: :destroy
  has_many :moods, through: :diaries
  belongs_to :doctor, class_name: "User", foreign_key: :doctor_id, optional: true
  after_create :create_diary

  def create_diary
    Diary.create(user: self, date: Date.today)

    Mood.create(diary: diaries.last, principal: true, position: 1)
    Mood.create(diary: diaries.last, principal: false, position: 2)
    Mood.create(diary: diaries.last, principal: false, position: 3)
    Mood.create(diary: diaries.last, principal: false, position: 4)

    # système pour ne pas réavoir deux fois la même reward
    if diaries.present?
      rewards_used = []
      diaries.each do |diary|
        rewards_used << diary.diary_rewards.last.reward.id unless diary.diary_rewards.empty?
      end
      rewards = Reward.where.not(id: rewards_used)
      DiaryReward.create(diary: diaries.last, reward: rewards.sample)
    else
      DiaryReward.create(diary: diaries.last, reward: Reward.all.sample)
    end

    # gratitude: "Aujourd'hui, j'ai de la gratitude pour..."

  end

  def data_moods_rating
    data = moods.where(principal: true).map {|mood| ["#{mood.diary.date}", mood.rating]}.to_h
    return data
  end

  def data_moods_position_2
    data = moods.where(position: 2).map {|mood| ["#{mood.diary.date}", mood.rating]}.to_h
    return data
  end

  def data_moods_position_3
    data = moods.where(position: 3).map {|mood| ["#{mood.diary.date}", mood.rating]}.to_h
    return data
  end

  def data_moods_position_4
    data = moods.where(position: 4).map {|mood| ["#{mood.diary.date}", mood.rating]}.to_h
    return data
  end
end
