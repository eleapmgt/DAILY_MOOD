class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :diaries
  belongs_to :doctor, class_name: "User", foreign_key: :doctor_id, optional: true
  after_create :create_diary

  def create_diary
    Diary.create(user: self, date: Date.today)
    Mood.create(diary: diaries.last, principal: true)
  end
end
