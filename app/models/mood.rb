class Mood < ApplicationRecord
  belongs_to :diary
  belongs_to :category
  scope :not_principal, -> { includes(:category).where.not(categories: {id: Category.principal.id})}
  scope :principal, -> { includes(:category).where(categories: {id: Category.principal.id})}
end
