class DiariesController < ApplicationController
  before_action :set_diary, only: %i[edit update]

  def index
    @diaries = Diary.all
    @user_categories = current_user.categories
    @other_categories = Category.excluding(@user_categories)
    @diaries = current_user.diaries
  end

  def edit
    unless @diary.gratitude.nil?
      flash[:notice] = "Tu as déjà fait ton daily aujourd'hui, reviens demain."
      redirect_to root_path
    end
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
