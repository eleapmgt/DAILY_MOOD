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
    Mood.create(diary: diaries.last, principal: true, position: 1)

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
