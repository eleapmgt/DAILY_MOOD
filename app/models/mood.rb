class Mood < ApplicationRecord
  belongs_to :diary
  scope :not_principal, -> {where(principal: false)}
  scope :principal, -> {where(principal: true)}
end
