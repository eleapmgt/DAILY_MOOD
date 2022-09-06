class Category < ApplicationRecord
  has_many :moods, dependent: :destroy
  has_many :user_categories, dependent: :destroy


  def self.principal
    Category.find_by(title: "humeur generale")
  end

  def self.secondary
    Category.where.not(title: "humeur generale")
  end
end
