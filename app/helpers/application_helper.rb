module ApplicationHelper
  def current_diary
    current_user.diaries.where(date: Date.today).last
  end
end
