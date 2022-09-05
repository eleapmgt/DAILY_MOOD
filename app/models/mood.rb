class Mood < ApplicationRecord
  belongs_to :diary
  belongs_to :category
  scope :not_principal, -> {where(principal: false)}
  scope :principal, -> {where(principal: true)}
end
