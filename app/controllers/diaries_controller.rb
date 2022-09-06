class DiariesController < ApplicationController
  before_action :set_diary, only: %i[edit update]

  def index
    @diaries = current_user.diaries
  end

  def edit
  end

  def update
    @diary.update(diary_params)
    redirect_to diary_moods_path(@diary)
  end

  def calendar
    @diaries = current_user.diaries
    if params[:date]
      @diary = @diaries.find_by(date: params[:date].to_date)
    end
  end

  private

  def set_diary
    @diary = Diary.find(params[:id])
  end

  def diary_params
    params.require(:diary).permit(:gratitude, :date, :user_id)
  end
end

# edit_diary_path(current_diary) --> chemin de home vers gratitude
