module ApplicationHelper
  def current_diary
    return nil unless current_user
    current_user.diaries.find_by(date: Date.today)
  end

end
