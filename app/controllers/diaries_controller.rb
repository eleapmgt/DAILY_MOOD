class DiariesController < ApplicationController
  before_action :set_diary, only: %i[edit update]

  def index
    @diaries = Diary.all
  end

  def edit
    @diary = Diary.find(params[:id])
  end

  def update
    @diary = Diary.find(params[:id])
    @diary.update(diary_params)
    redirect_to diary_moods_path(@diary)
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
