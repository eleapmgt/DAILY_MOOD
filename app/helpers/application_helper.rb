module ApplicationHelper
  def current_diary
    current_user.diaries.where(date: Date.today).last if current_user.present?
  end

end
