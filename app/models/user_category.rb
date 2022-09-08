class UserCategory < ApplicationRecord
  belongs_to :user
  belongs_to :category

  acts_as_list scope: :user
end
