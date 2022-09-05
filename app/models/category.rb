class Category < ApplicationRecord
  has_many :moods, dependent: :destroy
  has_many :user_categories, dependent: :destroy
end
