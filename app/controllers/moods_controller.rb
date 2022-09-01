class MoodsController < ApplicationController

  def index
    @moods = Mood.all
    @mood = Mood.new
    @diary = Diary.find(params[:diary_id])
  end

  def create
    @diary = Diary.find(params[:diary_id])
    @mood = Mood.new(mood_params)
    @mood.diary = @diary
    @mood = Mood.save
    redirect_to diary_diaries_reward_path(@diary, @diary.diary_reward.first)
  end

  def update
    @diary = Diary.find(params[:diary_id])
    @mood = Mood.find(params[:id])
    @mood.update(mood_params)
  end

  def update_text
    @diary = Diary.find(params[:diary_id])
    @mood = Mood.find(params[:id])
    @mood.update(mood_params)
    redirect_to diary_diaries_reward_path(@diary, @diary.diary_reward.last)
  end

  def destroy
    @mood = Mood.find(params[:diary_id])
    @mood.destroy
    redirect_to diary_mood path(@mood)
  end

  private

  def mood_params
    params.require(:mood).permit(:title, :content, :principal, :rating)
  end
end
