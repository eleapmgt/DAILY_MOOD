class DiariesRewardsController < ApplicationController

  def new
    @diary = Diary.find(params[:diary_id])
    @diary_reward = DiaryReward.new
  end

  def create
    @diary = Diary.find(params[:diary_id])
    reward = Reward.find_by(category: params[:category])
    @diary_reward = @diary.diary_rewards.build
    @diary_reward.reward = reward
    if @diary_reward.save
      respond_to do |format|
        format.html
        format.text { render partial: "diaries_rewards/modal", locals: { diary_reward: @diary_reward }, formats: [:html] }
      end
    else
      flash[:alert] = "You are not authorized to perform this action."
    end
  end

end
