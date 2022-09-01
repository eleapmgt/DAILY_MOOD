class ContentsController < ApplicationController
  def update
    @diary = Diary.find(params[:diary_id])
    @mood = Mood.find(params[:id])
    @mood.update(mood_params)
    redirect_to diary_diaries_reward_path(@diary, @diary.diary_rewards.last)
  end

  def mood_params
    params.require(:mood).permit(:content)
  end

end
